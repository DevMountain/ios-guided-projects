//
//  Playlist.swift
//  CoreDataMiniProject
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    
    private let kName = "name"
    private let kSongs = "songs"
    
    let name: String
    var songs: [Song]

    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }

}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}