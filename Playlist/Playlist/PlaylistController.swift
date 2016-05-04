//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] = []
    
    func addPlaylist(name: String) {
        let playlist = Playlist(name: name)
        playlists.append(playlist)
    }
    
    func deletePlaylist(playlist: Playlist) {
        guard let index = playlists.indexOf(playlist) else {return}
        playlists.removeAtIndex(index)
    }
    
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {return}
        playlist.songs.removeAtIndex(index)
    }
    
    
}