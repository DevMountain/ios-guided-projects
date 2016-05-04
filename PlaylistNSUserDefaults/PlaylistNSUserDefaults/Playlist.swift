//
//  Playlist.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    private let kName = "name"
    private let kSongs = "songs"
    
    let name: String
    var songs: [Song]
    
    var dictionaryCopy: [String: AnyObject] {
        return [kName: name, kSongs: songs.map{$0.dictionaryCopy}]
    }
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            songsDictionaryArray = dictionary[kSongs] as? [[String: AnyObject]] else {return nil}
        self.name = name
        self.songs = songsDictionaryArray.flatMap{Song(dictionary: $0)}
    }
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}