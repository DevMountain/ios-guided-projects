//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class PlaylistController {
    private let kPlaylists = "storedPlaylists"
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func addPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.indexOf(playlist) else {return}
        playlists.removeAtIndex(index)
        saveToPersistentStore()
    }
    
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {return}
        playlist.songs.removeAtIndex(index)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(playlists.map{$0.dictionaryCopy}, forKey: kPlaylists)
    }
    
    func loadFromPersistentStore() {
        guard let playlistsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String: AnyObject]] else {return}
        playlists = playlistsDictionaryArray.flatMap{Playlist(dictionary: $0)}
    }
    
}