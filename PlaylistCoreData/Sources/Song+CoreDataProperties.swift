//
//  Song+CoreDataProperties.swift
//  PlaylistCoreData
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Song {

    @NSManaged var name: String
    @NSManaged var artist: String
    @NSManaged var playlist: Playlist

}
