//
//  Stack.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData

class Stack {
	
	static let container: NSPersistentContainer = {
		
			let container = NSPersistentContainer(name: "PlaylistCoreData")
			container.loadPersistentStores() { (storeDescription, error) in
				if let error = error as NSError? {
					fatalError("Unresolved error \(error), \(error.userInfo)")
				}
			}
			return container
		}()
	
	static var context: NSManagedObjectContext { return container.viewContext }
}
