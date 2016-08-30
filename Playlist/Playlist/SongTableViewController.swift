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

    @IBAction func addButtonTapped(sender: AnyObject) {
        guard let playlist = playlist,
            song = songTextField.text,
            artist = artistTextField.text where song.characters.count > 0 && artist.characters.count > 0 else { return }
        SongController.createSong(song, artist: artist, playlist: playlist)
        songTextField.text = ""
        artistTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)
        
        if let song = playlist?.songs[indexPath.row] {
            cell.textLabel?.text = song.name
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Songs"
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let playlist = playlist else {return}
            let song = playlist.songs[indexPath.row]
            PlaylistController.sharedController.removeSongFromPlaylist(song, playlist: playlist)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
	
	// MARK: Properties
	
	var playlist: Playlist?
	
	@IBOutlet weak var songTextField: UITextField!
	@IBOutlet weak var artistTextField: UITextField!
}
