//
//  Song.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CloudKit

class Song: Equatable {
    
    init(name: String, artist: String, playlist: Playlist?) {
        self.name = name
        self.artist = artist
        self.playlist = playlist
    }
    
    init?(record: CKRecord) {
        
        guard let name = record[nameKey] as? String,
            let artist = record[artistKey] as? String else { return nil }
        
        self.name = name
        self.artist = artist
        self.cloudKitRecordID = record.recordID
    }
    
    var cloudKitRecord: CKRecord {
        
        let recordID = cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        let record = CKRecord(recordType: Song.typeKey, recordID: recordID)
        
        record.setValue(name, forKey: nameKey)
        record.setValue(artist, forKey: artistKey)
        
        if let playlistRecordID = playlist?.cloudKitRecordID {
            
            let playlistReference = CKReference(recordID: playlistRecordID, action: .deleteSelf)
            
            record.setValue(playlistReference, forKey: playlistRefKey)
        }
        
        return record
    }
	
    private let nameKey = "name"
    private let artistKey = "artist"
    private let playlistRefKey = "playlistRef"
    static let typeKey = "Song"
    
    
    let artist: String
    let name: String
    var cloudKitRecordID: CKRecordID?
    
    weak var playlist: Playlist?
}

func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.name == rhs.name &&
        lhs.artist == rhs.artist
}
