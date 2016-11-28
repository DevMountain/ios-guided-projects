//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 10/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Song {
	@discardableResult convenience init(name:String,
	                                    artist: String,
	                                    playlist: Playlist,
	                                    context: NSManagedObjectContext = CoreDataStack.context) {
		
		self.init(context: context)
		
		self.name = name
		self.artist = artist
		self.playlist = playlist
	}
}
