//
//  PlaylistController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    private let kPlaylists = "playlists"
    
    static let sharedController = PlaylistController()
    
    var myPlaylists: [Playlist] = []
    
    init() {
        observePlaylists { (playlists) in
            let oldPlaylists = self.myPlaylists
            self.myPlaylists = playlists
            if self.myPlaylists.count > oldPlaylists.count {
                NSNotificationCenter.defaultCenter().postNotificationName("playlistsChanged", object: nil)
            }
        }
    }
    
    func createPlaylist(name: String) {
        var playlist = Playlist(name: name)
        playlist.save()
    }
    
    func removePlaylist(playlist: Playlist) {
        if let index = myPlaylists.indexOf(playlist) {
            myPlaylists.removeAtIndex(index)
        }
        playlist.delete()
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {return}
        playlist.songs.removeAtIndex(index)
        song.delete()
    }
    
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        var song = Song(title: title, artist: artist, playlist: playlist)
        song.save()
    }
    
    func observePlaylists(completion: (playlists: [Playlist])->Void) {
        FirebaseController.base.childByAppendingPath("users/\(UserController.currentUser?.identifier ?? "")/playlists").observeEventType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: [String:AnyObject]] else {completion(playlists: []); return}
            let playlists = value.flatMap {Playlist(json: $1, identifier: $0)}
            completion(playlists: playlists)
        })
    }
    
    func observePlaylist(playlist: Playlist, completion: (playlist: Playlist?)->Void) {
        FirebaseController.base.childByAppendingPath("users/\(UserController.currentUser?.identifier ?? "")/playlists/\(playlist.identifier ?? "")").observeEventType(.Value, withBlock: { (data) in
            guard let value = data.value as? [String: AnyObject] else {return}
            let playlist = Playlist(json: value, identifier: data.key)
            completion(playlist: playlist)
        })
    }
    
}