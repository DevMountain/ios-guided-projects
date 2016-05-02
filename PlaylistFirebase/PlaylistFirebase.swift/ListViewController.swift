//
//  ListViewController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/15/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ListViewController.updateUI), name: "playlistsChanged", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let name = nameField.text where !name.isEmpty {
            PlaylistController.sharedController.createPlaylist(name)
        }
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell,
            indexPath = tableView.indexPathForCell(cell) {
            let playlist = PlaylistController.sharedController.myPlaylists[indexPath.row]
            let vc = segue.destinationViewController as? PlaylistDetailViewController
            vc?.playlist = playlist
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedController.myPlaylists.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        let playlist = PlaylistController.sharedController.myPlaylists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        return cell
    }
    
    // Delegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let playlist = PlaylistController.sharedController.myPlaylists[indexPath.row]
            PlaylistController.sharedController.removePlaylist(playlist)
            // Delete the row from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Playlists"
    }
    
}
