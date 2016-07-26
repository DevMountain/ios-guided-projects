//
//  CloudKitManager.swift
//  BulletinBoard
//
//  Created by Andrew Madsen on 6/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

private let CreatorUserRecordIDKey = "creatorUserRecordID"
private let LastModifiedUserRecordIDKey = "creatorUserRecordID"
private let CreationDateKey = "creationDate"
private let ModificationDateKey = "modificationDate"

class CloudKitManager {
	
	let database = CKContainer.defaultContainer().publicCloudDatabase
	
	func fetchRecordsWithType(type: String,
	                          sortDescriptors: [NSSortDescriptor]? = nil,
	                          completion: ([CKRecord]?, NSError?) -> Void) {
		
		let query = CKQuery(recordType: type, predicate: NSPredicate(value: true))
		query.sortDescriptors = sortDescriptors
		
		database.performQuery(query, inZoneWithID: nil, completionHandler: completion)
	}
	
	func saveRecord(record: CKRecord, completion: ((NSError?) -> Void) = {_ in }) {
		
		database.saveRecord(record) { (_, error) in
			completion(error)
		}
	}
	
	func subscribeToCreationOfRecordsWithType(type: String, completion: ((NSError?) -> Void)? = nil) {
		let subscription = CKSubscription(recordType: Message.recordType, predicate: NSPredicate(value: true), options: .FiresOnRecordCreation)
		let notificationInfo = CKNotificationInfo()
		notificationInfo.alertBody = "There's a new message on the bulletin board."
		notificationInfo.soundName = UILocalNotificationDefaultSoundName
		subscription.notificationInfo = notificationInfo
		database.saveSubscription(subscription) { (subscription, error) in
			if let error = error {
				NSLog("Error saving subscription: \(error)")
			}
			completion?(error)
		}
	}
}