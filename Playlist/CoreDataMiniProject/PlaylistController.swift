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
    
    static let sharedController = PlaylistController()
    
    var myPlaylists: [Playlist] = []

    func createPlaylist(name: String) {
        let playlist = Playlist(name: name)
        myPlaylists.append(playlist)
    }
    
    func removePlaylist(playlist: Playlist) {
        guard let index = myPlaylists.indexOf(playlist) else {return}
        myPlaylists.removeAtIndex(index)
    }

    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.indexOf(song) else {return}
        playlist.songs.removeAtIndex(index)
    }
    
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        let song = Song(title: title, artist: artist)
        playlist.songs.append(song)
    }
    
}