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
    
    var dictionaryCopy: [String: AnyObject] {
        return [kName: name, kSongs: songs.flatMap{$0.dictionaryCopy}]
    }
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String else {return nil}
        self.name = name
        self.songs = dictionary[kSongs] as? [Song] ?? []
    }
    
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}