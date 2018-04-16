//
//  CloudKitManager.swift
//  Playlist
//
//  Created by Spencer Curtis on 2/12/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    func saveRecordToCloudKit(record: CKRecord, database: CKDatabase, completion: @escaping (CKRecord?, Error?) -> Void = { (_, _ ) in }) {
        
        database.save(record) { (record, error) in
            completion(record, error)
        }
    }
    
    func deleteRecordFromCloudKitWith(recordID: CKRecordID, database: CKDatabase, completion: @escaping (Error?) -> Void) {
        database.delete(withRecordID: recordID) { (_, error) in
            completion(error)
        }
    }
    
    func fetchRecordsOf(type: String, predicate: NSPredicate = NSPredicate(value: true), database: CKDatabase, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        
        let query = CKQuery(recordType: type, predicate: predicate)
        
        database.perform(query, inZoneWith: nil, completionHandler: completion)
        
    }
    
    func subscribeToCreationOfRecordsOf(type: String, inDatabase database: CKDatabase, withNotificationTitle title: String?, alertBody: String?, andSoundName soundName: String?, completion: @escaping (CKSubscription?, Error?) -> Void) {
        
        let predicate = NSPredicate(value: true)
        
        let subscription = CKQuerySubscription(recordType: type, predicate: predicate, options: .firesOnRecordCreation)
        
        let notificationInfo = CKNotificationInfo()
        
        notificationInfo.title = title
        notificationInfo.alertBody = alertBody
        notificationInfo.soundName = soundName
        
        subscription.notificationInfo = notificationInfo
        
        database.save(subscription, completionHandler: completion)
    }
    
    
    func requestDiscoverabilityAuthorization(completion: @escaping (CKApplicationPermissionStatus, Error?) -> Void) {
        
        CKContainer.default().status(forApplicationPermission: .userDiscoverability) { (permissionStatus, error) in
            
            guard permissionStatus != .granted else { completion(.granted, error); return }
            
            CKContainer.default().requestApplicationPermission(.userDiscoverability, completionHandler: completion)
        }
    }
    
    func fetchUserIdentityWith(email: String, completion: @escaping (CKUserIdentity?, Error?) -> Void) {
        
        CKContainer.default().discoverUserIdentity(withEmailAddress: email, completionHandler: completion)
    }
    
    func fetchAllDiscoverableUserIdentities(completion: @escaping ([CKUserIdentity], Error?) -> Void) {
        
        let discoverIdentitiesOp = CKDiscoverAllUserIdentitiesOperation()
        
        var discoveredIdentities: [CKUserIdentity] = []
        
        discoverIdentitiesOp.userIdentityDiscoveredBlock = { identity in
            
            discoveredIdentities.append(identity)
        }
        
        discoverIdentitiesOp.discoverAllUserIdentitiesCompletionBlock = { error in
            
            completion(discoveredIdentities, error)
        }
        
        CKContainer.default().add(discoverIdentitiesOp)
    }
}
