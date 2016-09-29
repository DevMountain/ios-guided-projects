//
//  SongTableViewController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let playlist = playlist {
            self.title = playlist.name
        }
    }

    @IBAction func addButtonTapped(_ sender: AnyObject) {
        guard let playlist = playlist,
            let song = songTextField.text,
            let artist = artistTextField.text , song.characters.count > 0 && artist.characters.count > 0 else {return}
        SongController.createSong(song, artist: artist, playlist: playlist)
        songTextField.text = ""
        artistTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        if let playlist = playlist,
            let song = playlist.songs.object(at: (indexPath as NSIndexPath).row) as? Song {
            cell.textLabel?.text = song.name
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Songs"
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist,
                let song = playlist.songs.object(at: (indexPath as NSIndexPath).row) as? Song else {return}
            SongController.deleteSong(song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
