//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let shared = PlaylistController()
    
    func add(playlistWithName name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
    }
    
    func delete(playlist: Playlist) {
        guard let index = playlists.index(of: playlist) else { return }
        playlists.remove(at: index)
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
    }
 
	// MARK: Properties
	
	var playlists = [Playlist]()
}
