//
//  Playlist.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    fileprivate static let NameKey = "name"
    fileprivate static let SongsKey = "songs"
	
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
	
	// MARK: Dictionary Conversion
    
    convenience init?(dictionary: [String: Any]) {
        guard let name = dictionary[Playlist.NameKey] as? String,
            let songDictionaries = dictionary[Playlist.SongsKey] as? [[String: Any]] else { return nil }
		
        let songs = songDictionaries.compactMap { Song(dictionary: $0) }
		
		self.init(name: name, songs: songs)
    }
	
	var dictionaryRepresentation: [String: Any] {
		let songDictionaries = songs.map { $0.dictionaryRepresentation }
		return [Playlist.NameKey: name as Any, Playlist.SongsKey: songDictionaries as Any]
	}
	
	// MARK: Properties
	
	let name: String
	var songs: [Song]
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}
