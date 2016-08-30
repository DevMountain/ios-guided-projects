//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class PlaylistController {
    private static let PlaylistsKey = "playlists"
    
    static let sharedController = PlaylistController()
    
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
		let userDefaults = NSUserDefaults.standardUserDefaults()
		let playlistDictionaries = playlists.map { $0.dictionaryRepresentation }
        userDefaults.setObject(playlistDictionaries, forKey: PlaylistController.PlaylistsKey)
    }
    
    func loadFromPersistentStore() {
		let userDefaults = NSUserDefaults.standardUserDefaults()
        guard let playlistDictionaries = userDefaults.objectForKey(PlaylistController.PlaylistsKey) as? [[String: AnyObject]] else { return }
        playlists = playlistDictionaries.flatMap { Playlist(dictionary: $0) }
    }
	
	// MARK: Properties 
	
	var playlists = [Playlist]()
}