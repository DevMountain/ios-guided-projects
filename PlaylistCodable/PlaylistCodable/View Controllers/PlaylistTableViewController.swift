//
//  PlaylistTableViewController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistTextField.text, !playlistName.isEmpty else { return }
        PlaylistController.shared.add(playlistWithName: playlistName)
        playlistTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource/Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        cell.textLabel?.text = playlist.name
        
        if playlist.songs.count == 1 {
            cell.detailTextLabel?.text = "1 Song"
        } else {
            cell.detailTextLabel?.text = "\(playlist.songs.count) Songs"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlists"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlaylistDetail",
            let indexPath = tableView.indexPathForSelectedRow {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            let songVC = segue.destination as? SongTableViewController
            songVC?.playlist = playlist
        }
    }
    
    // MARK: Properties
    
    @IBOutlet weak var playlistTextField: UITextField!
}
