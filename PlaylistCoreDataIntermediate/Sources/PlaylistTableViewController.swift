//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class PlaylistTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
		fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
		fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
		                                            managedObjectContext: CoreDataStack.context,
		                                            sectionNameKeyPath: nil,
		                                            cacheName: nil)
		fetchedResultsController.delegate = self
		do {
			try fetchedResultsController.performFetch()
		} catch {
			NSLog("Error performing fetch request: \(error)")
		}
	}
	
	// MARK: Actions
	
	@IBAction func addButtonTapped(_ sender: AnyObject) {
		guard let playlistName = playlistTextField.text, !playlistName.isEmpty else {return}
		PlaylistController.sharedInstance.create(playlistWithName: playlistName)
		playlistTextField.text = ""
	}
	
	// MARK: UITableViewDataSource/Delegate
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return fetchedResultsController.fetchedObjects?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
		
		guard let playlists = fetchedResultsController.fetchedObjects else { return cell }
		let playlist = playlists[indexPath.row]
		cell.textLabel?.text = playlist.name
		cell.detailTextLabel?.text = "\(playlist.songs!.count) songs"
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Playlists"
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
			PlaylistController.sharedInstance.delete(playlist)
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
	
	// MARK: Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toPlaylistDetail",
			let indexPath = tableView.indexPathForSelectedRow {
			let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
			let songVC = segue.destination as? SongTableViewController
			songVC?.playlist = playlist
		}
	}
	
	// MARK: Properties
	
	var fetchedResultsController: NSFetchedResultsController<Playlist>!
	
	@IBOutlet weak var playlistTextField: UITextField!
	
}
