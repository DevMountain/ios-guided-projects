//
//  Playlist.swift
//  CoreDataMiniProject
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Playlist: Equatable, FirebaseType {
    
    private let kName = "name"
    private let kSongs = "songs"
    
    let name: String
    var songs: [Song]
    var endpoint: String {
        return "users/\(UserController.currentUser?.identifier ?? "")/playlists"
    }
    var identifier: String?
    
    var jsonValue: [String: AnyObject] {
        return [kName: name, kSongs: songs.map{$0.jsonValue}]
    }
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let name = json[kName] as? String else {return nil}
        self.name = name
        let songsDictionary = (json[kSongs] as? [String: [String: AnyObject]]) ?? [:]
        self.songs = songsDictionary.flatMap{Song(json: $1, identifier: $0)}
        for song in songs {
            song.playlistIdentifier = identifier
        }
        self.identifier = identifier
    }
    
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}