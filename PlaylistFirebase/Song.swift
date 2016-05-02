//
//  Song.swift
//  CoreDataMiniProject
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Song: Equatable, FirebaseType {
    
    private let kTitle = "title"
    private let kArtist = "artist"
    
    let title: String
    let artist: String
    var identifier: String?
    var playlistIdentifier: String?
    var endpoint: String {
        return "users/\(UserController.currentUser?.identifier ?? "")/playlists/\(playlistIdentifier ?? "")/songs"
    }
    var jsonValue: [String: AnyObject] {
        return [kTitle: title, kArtist: artist]
    }
    
    init(title: String, artist: String, playlist: Playlist) {
        self.title = title
        self.artist = artist
        self.playlistIdentifier = playlist.identifier
    }
    
    required init?(json: [String: AnyObject], identifier: String) {
        guard let title = json[kTitle] as? String,
            artist = json[kArtist] as? String else {return nil}
        self.title = title
        self.artist = artist
        self.identifier = identifier
    }
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist
}