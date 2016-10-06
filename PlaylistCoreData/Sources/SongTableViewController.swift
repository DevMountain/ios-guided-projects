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
			let song = songTextField.text,
			let artist = artistTextField.text , song.characters.count > 0 && artist.characters.count > 0 else {return}
		SongController.createSong(song, artist: artist, playlist: playlist)
		songTextField.text = ""
		artistTextField.text = ""
		tableView.reloadData()
	}
	
	// MARK: UITableViewDataSource/Delegate
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playlist?.songs?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
		
		if let playlist = playlist,
			let song = playlist.songs?.object(at: (indexPath as NSIndexPath).row) as? Song {
			cell.textLabel?.text = song.name
			cell.detailTextLabel?.text = song.artist
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Songs"
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			guard let playlist = playlist,
				let song = playlist.songs?.object(at: (indexPath as NSIndexPath).row) as? Song else {return}
			SongController.deleteSong(song)
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
