//
//  Playlist.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CloudKit

class Playlist: Equatable {
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    init?(record: CKRecord) {
        
        guard let name = record[nameKey] as? String else { return nil }
        
        self.name = name
        self.songs = []
        self.cloudKitRecordID = record.recordID
    }
    
    var cloudKitRecord: CKRecord {
        
        let recordID = cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        let record = CKRecord(recordType: Playlist.typeKey, recordID: recordID)
        
        record.setValue(name, forKey: nameKey)
        
        return record
    }
    
    private let nameKey = "name"
    static let typeKey = "Playlist"
	
    let name: String
    var songs: [Song]
    var cloudKitRecordID: CKRecordID?
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name &&
        lhs.songs == rhs.songs
}
