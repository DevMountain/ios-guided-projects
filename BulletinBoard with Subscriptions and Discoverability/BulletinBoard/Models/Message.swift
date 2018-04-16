//
//  Message.swift
//  BulletinBoard
//
//  Created by Spencer Curtis on 1/24/18.
//  Copyright © 2018 Spencer Curtis. All rights reserved.
//

import Foundation
import CloudKit

class Message {
    
    static let TypeKey = "Message"
    private let TextKey = "text"
    private let TimestampKey = "timestamp"
    
    let text: String
    let timestamp: Date
    
    init(text: String, timestamp: Date = Date()) {
        self.text = text
        self.timestamp = timestamp
    }
    
    init?(cloudKitRecord: CKRecord) {
        
        guard let text = cloudKitRecord[TextKey] as? String,
            let timestamp = cloudKitRecord[TimestampKey] as? Date else { return nil }
        
        self.text = text
        self.timestamp = timestamp
    }
    
    var cloudKitRecord: CKRecord {
        
         let record = CKRecord(recordType: Message.TypeKey)
        
        record.setValue(text, forKey: TextKey)
        record[TimestampKey] = timestamp as CKRecordValue
        
        return record
    }
    
    
}




