//
//  Playlist.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class Playlist: Equatable, Codable {
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    // MARK: Properties
    
    let name: String
    var songs: [Song]
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}
