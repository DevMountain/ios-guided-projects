//
//  Song.swift
//  CoreDataMiniProject
//
//  Created by James Pacheco on 4/19/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation

class Song: Equatable {
    
    private let kTitle = "title"
    private let kArtist = "artist"
    
    let title: String
    let artist: String

    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }

}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.title == rhs.title && lhs.artist == rhs.artist
}