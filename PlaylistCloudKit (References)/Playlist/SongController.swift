//
//  SongController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithName name: String, artist: String, playlist: Playlist, completion: @escaping () -> Void) {
        let song = Song(name: name, artist: artist, playlist: playlist)
		
        CloudKitManager.shared.saveRecordToCloudKit(record: song.cloudKitRecord, database: PlaylistController.shared.database) { (record, error) in
            
            if let error = error {
                print("Error saving song record to CloudKit: \(error.localizedDescription)")
            } else {
                song.cloudKitRecordID = record?.recordID
                PlaylistController.shared.add(song: song, toPlaylist: playlist)
            }
            
            completion()
        }
    }
}
