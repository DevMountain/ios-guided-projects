//
//  SongController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithName name: String, artist: String, playlist: Playlist) {
        let song = Song(name: name, artist: artist)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)
    }
}
