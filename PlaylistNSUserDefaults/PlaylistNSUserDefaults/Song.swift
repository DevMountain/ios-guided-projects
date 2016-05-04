//
//  Song.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Song: Equatable {
    private let kName = "name"
    private let kArtist = "kArtist"
    
    let name: String
    let artist: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [kName: name, kArtist: artist]
    }
    
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
            artist = dictionary[kArtist] as? String else {return nil}
        self.name = name
        self.artist = artist
    }
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.name == rhs.name && lhs.artist == rhs.artist
}