//
//  Song+CoreDataProperties.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song");
    }

    @NSManaged public var artist: String?
    @NSManaged public var name: String?
    @NSManaged public var playlist: Playlist?

}
