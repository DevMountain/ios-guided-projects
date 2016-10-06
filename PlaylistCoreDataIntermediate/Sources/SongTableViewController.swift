//
//  SongTableViewController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = playlist?.name
	}
	
	// Actions
	
	@IBAction func addButtonTapped(_ sender: AnyObject) {
		guard let playlist = playlist,
			let name = songTextField.text,
			let artist = artistTextField.text,
			name.characters.count > 0 && artist.characters.count > 0 else { return }
		SongController.create(songWithName: name, artist: artist, playlist: playlist)
		songTextField.text = ""
		artistTextField.text = ""
		tableView.reloadData()
	}
	
	// MARK: UITableViewDataSource/Delegate
	
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
		return "Songs"
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			guard let playlist = playlist,
				let song = playlist.songs?.object(at: indexPath.row) as? Song else {return}
			SongController.delete(song: song)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	// MARK: Properties
	
	var playlist: Playlist? {
		didSet {
			tableView.reloadData()
		}
	}
	
	@IBOutlet weak var songTextField: UITextField!
	@IBOutlet weak var artistTextField: UITextField!
}
