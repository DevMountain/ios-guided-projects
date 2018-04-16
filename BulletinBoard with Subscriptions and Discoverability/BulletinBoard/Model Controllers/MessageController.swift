//
//  MessageController.swift
//  BulletinBoard
//
//  Created by Spencer Curtis on 1/24/18.
//  Copyright © 2018 Spencer Curtis. All rights reserved.
//

import Foundation
import CloudKit

class MessageController {
    
    static let shared = MessageController()
    
    let messagesWereUpdatedNotification = Notification.Name("messagesWereUpdated")
    
    var messages: [Message] = [] {
        didSet {
            NotificationCenter.default.post(name: messagesWereUpdatedNotification, object: nil)
        }
    }
    
    var searchedUserMessages: [Message] = [] {
        didSet {
            NotificationCenter.default.post(name: messagesWereUpdatedNotification, object: nil)
        }
    }
    
    func saveMessageRecordToiCloudWith(text: String) {
        
        let message = Message(text: text)
        
        CloudKitManager.shared.saveRecordToCloudKit(record: message.cloudKitRecord, database: CKContainer.default().publicCloudDatabase) { (error) in
            
            if let error = error {
                print("Error saving message record to iCloud: \(error.localizedDescription)")
            } else {
                self.messages.append(message)
            }
        }
    }
    
    func fetchMessageRecordsFromiCloud() {
        
        CloudKitManager.shared.fetchRecordsOf(type: Message.TypeKey, database: CKContainer.default().publicCloudDatabase) { (records, error) in
            
            if let error = error { print("Error fetching message records from iCloud: \(error.localizedDescription)") }
            
            guard let records = records else { return }
            
            let messages = records.flatMap({ Message(cloudKitRecord: $0) })
            
            self.messages = messages
        }
    }
    
    // NEW:
    
    func subscribeToNewMessages() {
        CloudKitManager.shared.subscribeToCreationOfRecordsOf(type: Message.TypeKey, inDatabase: CKContainer.default().publicCloudDatabase, withNotificationTitle: "Check it out:", alertBody: "There is a new message on the board!", andSoundName: "default") { (_, error) in
            if let error = error {
                print("Error saving subscription: \(error.localizedDescription)")
            } else {
                print("Subscription saved successfully")
            }
        }
    }
    
    func fetchMessagesFromUserWith(email: String) {
        
        CloudKitManager.shared.fetchUserIdentityWith(email: email) { (identity, error) in
            if let error = error { print(error.localizedDescription) }
            
            guard let identity = identity,
                let userRecordID = identity.userRecordID else { return }
            
            let predicate = NSPredicate(format: "creatorUserRecordID == %@", userRecordID)
            
            let query = CKQuery(recordType: Message.TypeKey, predicate: predicate)
            
            CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                
                if let error = error { print("Error fetching message records from iCloud: \(error.localizedDescription)") }
                
                guard let records = records else { return }
                
                let messages = records.flatMap({ Message(cloudKitRecord: $0) })
                
                self.searchedUserMessages = messages
            })
        }
    }    
}



