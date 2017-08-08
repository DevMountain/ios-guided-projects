//
//  UserController.swift
//  CloudKitUsers
//
//  Created by Spencer Curtis on 3/23/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

import Foundation
import CloudKit

class UserController {
    
    static let shared = UserController()
    
    var appleUserRecordID: CKRecordID?
    
    let currentUserWasSetNotification = Notification.Name("currentUserWasSet")
    
    var currentUser: User? {
        didSet {
            NotificationCenter.default.post(name: currentUserWasSetNotification, object: nil)
        }
    }
    
    init() {
        CKContainer.default().fetchUserRecordID { (recordID, error) in
            guard let recordID = recordID else { return }
            
            self.appleUserRecordID = recordID
        }
        
        CloudKitManager.shared.fetchCurrentUser { (currentUser) in
            self.currentUser = currentUser
        }
    }
    
    // CRUD
    
   
    
    // This will get called when they tap the save button
    func createUser(username: String, email: String, age: String, completion: @escaping (User?) -> Void) {
        
        guard let appleUserRecordID = appleUserRecordID else { completion(nil); return }
        
        let appleUserRef = CKReference(recordID: appleUserRecordID, action: .deleteSelf)
        
        let user = User(username: username, email: email, age: age, appleUserRef: appleUserRef)
        
        let userRecord = CKRecord(user: user)
        
        CKContainer.default().publicCloudDatabase.save(userRecord) { (record, error) in
            if let error = error { print(error.localizedDescription) }
            
            guard let record = record, let currentUser = User(cloudKitRecord: record) else { completion(nil); return }
            
            self.currentUser = currentUser
            completion(currentUser)
        }
    }
    
    func updateCurrentUser(username: String, email: String, age: String, completion: @escaping (User?) -> Void) {
        
        guard let currentUser = currentUser else { return }
        
        currentUser.username = username
        currentUser.email = email
        currentUser.age = age
        
        let currentUserRecord = CKRecord(user: currentUser)
        
        CKContainer.default().publicCloudDatabase.save(currentUserRecord) { (record, error) in
            if let error = error { print(error.localizedDescription) }
            
            self.currentUser = currentUser
            completion(currentUser)
        }
    }
}









