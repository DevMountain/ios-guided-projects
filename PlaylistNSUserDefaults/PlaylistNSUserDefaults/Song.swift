//
//  Song.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Song: Equatable {
    private static let NameKey = "name"
    private static let ArtistKey = "artist"
	
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
	
	// MARK: Dictionary Conversion
    
    convenience init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[Song.NameKey] as? String,
            artist = dictionary[Song.ArtistKey] as? String else { return nil }
		self.init(name: name, artist: artist)
    }
	
	var dictionaryRepresentation: [String: AnyObject] {
		return [Song.NameKey: name, Song.ArtistKey: artist]
	}

	// MARK: Properties
	
	let name: String
	let artist: String
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.name == rhs.name && lhs.artist == rhs.artist
}