//
//  MessagesController.swift
//  BulletinBoard
//
//  Created by Andrew Madsen on 6/18/16.
//  Copyright © 2016 Open Reel Software. All rights reserved.
//

import Foundation
import CloudKit

#if os(OSX)
	import Cocoa
#else
	import UIKit
#endif

public let MessagesControllerDidRefreshNotification = "MessagesControllerDidRefreshNotification"

public class MessagesController: NSObject {
	public static let sharedController = MessagesController()
	
	override init() {
		super.init()
		refresh()
	}
	
	// MARK: Public Methods
	
	func postNewMessage(message: Message, completion: ((NSError?) -> Void)? = nil) {
		let record = message.cloudKitRecord
		
		cloudKitManager.saveRecord(message.cloudKitRecord) { (record, error) in
			defer { completion?(error) }
			if let error = error {
				NSLog("Error saving \(message) to CloudKit: \(error)")
				return
			}
			self.messages.append(message)
		}
	}
	
	func refresh(completion: ((NSError?) -> Void)? = nil) {

		cloudKitManager.fetchRecordsWithType(Message.recordType, recordFetchedBlock: nil) { (records, error) in
			defer { completion?(error) }
			if let error = error {
				NSLog("Error fetching from CloudKit: \(error)")
				return
			}
			guard let records = records else { return }
			self.messages = records.flatMap { Message(cloudKitRecord: $0) }.sort { $0.date.compare($1.date) == NSComparisonResult.OrderedAscending }
		}
	}
	
	func subscribeForPushNotifications(completion: ((NSError?) -> Void)? = nil) {
		cloudKitManager.subscribe(Message.recordType,
		                          predicate: NSPredicate(value: true),
		                          subscriptionID: "MessagesSubscription",
		                          contentAvailable: false,
		                          alertBody: "There's a new message on the bulletin board!",
		                          options: .FiresOnRecordCreation) { (subscription, error) in
			if let error = error {
				NSLog("Error saving subscription: \(error)")
			} else {
				NSLog("Subscribed to push notifications for new messages")
			}
			completion?(error)
		}
	}
	
	// MARK: Private Methods
	
	// MARK: Public Properties
	
	private(set) var messages = [Message]() {
		didSet {
			dispatch_async(dispatch_get_main_queue()) { 
				let nc = NSNotificationCenter.defaultCenter()
				nc.postNotificationName(MessagesControllerDidRefreshNotification, object: self)
			}
		}
	}
	
	// MARK: Private Properties
	
	private let cloudKitManager = CloudKitManager()
	
}












