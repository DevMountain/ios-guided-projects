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
	
	// MARK: Public Methods
	
	func createNewContact(in context: NSManagedObjectContext? = nil) -> Contact {
		return Contact(context: (context ?? container.viewContext))
	}
	
	// MARK: Private Methods
	
	// MARK: Public Properties
	
	var contacts: [Contact] {
		let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
		var result: [Contact]!
		
		container.viewContext.performAndWait {
			result = try! fetchRequest.execute()
		}
		
		return result
	}
	
	let container: NSPersistentContainer = {
		let result = NSPersistentContainer(name: "AddressBook")
		result.loadPersistentStores { (description, error) in
			if let error = error {
				fatalError(error.localizedDescription)
			}
		}
		return result
	}()
}
