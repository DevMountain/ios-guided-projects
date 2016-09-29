//
//  SongController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static func createSong(_ name: String, artist: String, playlist: Playlist) {
        let _ = Song(name: name, artist: artist, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    static func deleteSong(_ song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
            PlaylistController.sharedInstance.saveToPersistentStore()
        }
    }

}
