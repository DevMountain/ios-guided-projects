//
//  Song+CoreDataClass.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

public class Song: NSManagedObject {

	@discardableResult convenience init?(name:String,
	                  artist: String,
	                  playlist: Playlist,
	                  context: NSManagedObjectContext = Stack.container.viewContext) {
		
		self.init(context: context)
		
		self.name = name
		self.artist = artist
		self.playlist = playlist
	}
	
}
