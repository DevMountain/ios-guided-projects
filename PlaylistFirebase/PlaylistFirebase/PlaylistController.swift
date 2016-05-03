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
        loadFromPersistentStore()
    }
    
    func saveToPersistentStore() {
        let playlistsDictionaryArray = myPlaylists.map{$0.dictionaryCopy}
        NSUserDefaults.standardUserDefaults().setObject(playlistsDictionaryArray, forKey: kPlaylists)
    }
    
    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        myPlaylists.append(playlist)
        saveToPersistentStore()
    }
    
    // TEACHING NOTE: - deletes playlist from managed object context, after which you need to save to persistent store to make permanent
    func removePlaylist(playlist: Playlist) {
        guard let index = myPlaylists.indexOf(playlist) else {return}
        myPlaylists.removeAtIndex(index)
        saveToPersistentStore()
    }
    
    // TEACHING NOTE: - deleting a song from the managed object context automatically deletes it from the playlist because of the relationship we set up in the model
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {return}
        playlist.songs.removeAtIndex(index)
        saveToPersistentStore()
    }
    
    // TEACHING NOTE: - initializing a song automatically adds it to a playlist because of the relationship we set up in the model
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        let song = Song(title: title, artist: artist)
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func loadFromPersistentStore() {
        guard let playlistsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String: AnyObject]] else {return}
        self.myPlaylists = playlistsDictionaryArray.flatMap {Playlist(dictionary: $0)}
    }
    
}