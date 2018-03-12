//
//  ContactsController.swift
//  AddressBook
//
//  Created by Andrew Madsen on 3/6/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class ContactsController {
	
	static let shared = ContactsController()
	
	init() {
		
		syncContext = Database.shared.container.newBackgroundContext()
		
		let nc = NotificationCenter.default
		nc.addObserver(self,
					   selector: #selector(managedObjectContextDidSave(_:)),
					   name: .NSManagedObjectContextDidSave,
					   object: database.mainContext)
	}
	
	// MARK: Public Methods
	
	func createNewContact(in context: NSManagedObjectContext? = nil) -> Contact {
		return Contact(context: (context ?? database.mainContext))
	}
	
	func contact(with uniqueID: UUID, in context: NSManagedObjectContext) -> Contact? {
		let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "uniqueID == %@", uniqueID as NSUUID)
		var result: Contact? = nil
		context.performAndWait {
			result = (try? fetchRequest.execute())?.first
		}
		return result
	}
	
	func syncAllContacts(completion: @escaping (Error?) -> Void = { _ in }) {

		downloadContactsSinceLastSync { (error) in
			if let error = error {
				completion(error)
				return
			}
		
			self.syncContext.performAndWait {
				do {
					try self.syncContext.save()
				} catch {
					completion(error)
					return
				}
			}
			
			let date = Date()
			
			self.uploadChangedContacts { (error) in
				if let error = error {
					completion(error)
					return
				}
				
				self.lastSyncDate = date
				completion(nil)
			}
		}
	}
	
	// MARK: Notifications
	
	@objc private func managedObjectContextDidSave(_ notification: Notification) {
		uploadChangedContacts { (error) in
			if let error = error {
				NSLog("Error uploading contacts: \(error)")
				return
			}
		}
	}
	
	// MARK: Private Methods
	
	private func downloadContactsSinceLastSync(completion: @escaping (Error?) -> Void) {
		
		networkClient.fetchContacts(modifiedAfter: lastSyncDate) { (dictionary, error) in
			if let error = error {
				completion(error)
				return
			}
			
			let context = self.syncContext
			context.perform {
				for (uniqueID, contactDict) in dictionary {
					var dict = contactDict
					dict["uniqueID"] = uniqueID
					guard let uuid = UUID(uuidString: uniqueID) else { continue }
					if let contact = self.contact(with: uuid, in: context) {
						contact.update(with: dict)
					} else {
						// Create a new contact
						_ = Contact(context: context, dictionary: dict)
					}
				}
				
				do {
					try context.save()
				} catch {
					completion(error)
				}
				
				completion(nil)
			}
		}
	}
	
	private func uploadChangedContacts(completion: @escaping (Error?) -> Void) {
		let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
		
		if let lastSyncDate = lastSyncDate {
			fetchRequest.predicate = NSPredicate(format: "modificationDate > %@", lastSyncDate as NSDate)
		}
		
		let context = database.container.newBackgroundContext()
		context.perform {
			do {
				let contactsToSync = try fetchRequest.execute()
				var dictionary = [String : [String : Any]]()
				for contact in contactsToSync {
					var dict = contact.dictionaryRepresentation
					let uid = dict["uniqueID"] as! String
					dict.removeValue(forKey: "uniqueID")
					dictionary[uid] = dict
				}
				self.networkClient.uploadContacts(contacts: dictionary) { (error) in
					if let error = error {
						completion(error)
						return
					}
					
					var succeeded = true
					context.performAndWait {
						do {
							try context.save()
						} catch {
							NSLog("Error saving context after sync: \(error)")
							completion(error)
							succeeded = false
						}
					}
					guard succeeded else { return }
					completion(nil)
				}
			} catch {
				NSLog("Error performing fetch request: \(error)")
				completion(error)
			}
		}
	}
	
	// MARK: Public Properties
	
	var contacts: [Contact] {
		let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
		var result: [Contact]!
		
		database.mainContext.performAndWait {
			result = try! fetchRequest.execute()
		}
		
		return result
	}
	
	// MARK: Private Properties
	
	private var database = Database.shared
	private var networkClient = NetworkClient()
	private var syncContext: NSManagedObjectContext
	
	private var lastSyncDate: Date? {
		get {
			return UserDefaults.standard.object(forKey: "LastSyncDate") as? Date
		}
		
		set {
			UserDefaults.standard.set(newValue, forKey: "LastSyncDate")
		}
	}
}
