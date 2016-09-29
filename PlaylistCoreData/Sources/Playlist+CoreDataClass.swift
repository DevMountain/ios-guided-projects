//
//  Playlist+CoreDataClass.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

public class Playlist: NSManagedObject {
	
	@discardableResult convenience init?(name: String,
	                  context: NSManagedObjectContext = Stack.context) {
		self.init(context: context)
		self.name = name
	}
}
