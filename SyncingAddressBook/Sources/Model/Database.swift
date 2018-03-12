//
//  Database.swift
//  AddressBook
//
//  Created by Andrew R Madsen on 3/12/18.
//  Copyright © 2018 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Database {
	static let shared = Database()
	
	var mainContext: NSManagedObjectContext {
		return container.viewContext
	}
	
	let container: NSPersistentContainer = {
		let result = NSPersistentContainer(name: "AddressBook")
		result.loadPersistentStores { (description, error) in
			if let error = error {
				fatalError(error.localizedDescription)
			}
		}
		result.viewContext.automaticallyMergesChangesFromParent = true
		return result
	}()
}
