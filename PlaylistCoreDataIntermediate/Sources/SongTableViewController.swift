//
//  SongTableViewController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class SongTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = playlist?.name
		
		configureFetchedResultsController()
	}
	
	// Actions
	
	@IBAction func addButtonTapped(_ sender: AnyObject) {
		guard let playlist = playlist,
			let name = songTextField.text,
			let artist = artistTextField.text,
			name.count > 0 && artist.count > 0 else { return }
		SongController.create(songWithName: name, artist: artist, playlist: playlist)
		songTextField.text = ""
		artistTextField.text = ""
	}
	
	// MARK: UITableViewDataSource/Delegate
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return fetchedResultsController.sections?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playlist?.songs?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongTableViewCell else {
			return SongTableViewCell()
		}
		
		guard let playlist = playlist else { return cell }
		cell.song = playlist.songs?.object(at: indexPath.row) as? Song
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return "Favorites"
		} else {
			return "Songs"
		}
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			guard let playlist = playlist,
				let song = playlist.songs?.object(at: indexPath.row) as? Song else {return}
			SongController.delete(song: song)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	// MARK: NSFetchedResultsControllerDelegate
	
	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}
	
	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()
	}
	
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
	                didChange anObject: Any,
	                at indexPath: IndexPath?,
	                for type: NSFetchedResultsChangeType,
	                newIndexPath: IndexPath?) {
		switch type {
		case .delete:
			guard let indexPath = indexPath else { return }
			tableView.deleteRows(at: [indexPath], with: .fade)
		case .insert:
			guard let newIndexPath = newIndexPath else { return }
			tableView.insertRows(at: [newIndexPath], with: .automatic)
		case .move:
			guard let indexPath = indexPath,
				let newIndexPath = newIndexPath else { return }
			tableView.moveRow(at: indexPath, to: newIndexPath)
		case .update:
			guard let indexPath = indexPath else { return }
			tableView.reloadRows(at: [indexPath], with: .automatic)
		}
	}
	
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
	                didChange sectionInfo: NSFetchedResultsSectionInfo,
	                atSectionIndex sectionIndex: Int,
	                for type: NSFetchedResultsChangeType) {
		switch type {
		case .delete:
			tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
		case .insert:
			tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
		default:
			break
		}
	}
	
	// MARK: Private
	
	private func configureFetchedResultsController() {
		guard let playlist = playlist else { return }
		
		if fetchedResultsController == nil {
			let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
			fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
			fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
			                                                      managedObjectContext: CoreDataStack.context,
			                                                      sectionNameKeyPath: "favorite",
			                                                      cacheName: nil)
			fetchedResultsController.delegate = self
		}
		
		let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
		fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
		fetchRequest.predicate = NSPredicate(format: "playlist == %@", playlist)
		
		do {
			try fetchedResultsController.performFetch()
		} catch {
			NSLog("Error performing fetch request: \(error)")
		}
	}
	
	// MARK: Properties
	
	var fetchedResultsController: NSFetchedResultsController<Song>!
	
	var playlist: Playlist? {
		didSet {
			configureFetchedResultsController()
		}
	}
	
	@IBOutlet weak var songTextField: UITextField!
	@IBOutlet weak var artistTextField: UITextField!
}
