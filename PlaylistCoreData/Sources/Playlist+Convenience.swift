//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 10/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {
	@discardableResult convenience init(name: String,
	                                    context: NSManagedObjectContext = CoreDataStack.context) {
		self.init(context: context)
		self.name = name
	}
}
