//
//  SongTableViewController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = playlist?.name
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
            let name = songTextField.text,
            let artist = artistTextField.text,
            !name.isEmpty && !artist.isEmpty else { return }
        
        SongController.create(songWithName: name, artist: artist, playlist: playlist)
        songTextField.text = ""
        artistTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource/Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        if let song = playlist?.songs[indexPath.row] {
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
            guard let playlist = playlist else { return }
            let song = playlist.songs[indexPath.row]
            PlaylistController.shared.remove(song: song, fromPlaylist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: Properties
    
    var playlist: Playlist?
    
    @IBOutlet weak var songTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
}
