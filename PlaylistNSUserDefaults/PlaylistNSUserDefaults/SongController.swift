//
//  SongController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class SongController {
    
    static func createSong(name: String, artist: String, playlist: Playlist) {
        let song = Song(name: name, artist: artist)
        PlaylistController.sharedInstance.addSongToPlaylist(song, playlist: playlist)
    }

}