//
//  Playlist.swift
//  PlaylistCoreData
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Playlist: NSManagedObject {

    // TEACHING NOTE: - Since Playlist is now a subclass of NSManagedObject, CoreData will call the initWithEntity:insertIntoManagedObjectContext: initializer when load from persistent store. However, subclasses don't automatically inherit their superclasses initializers unless explicitly overriden OR unless they don't have any main initializers of their own. A convenience initializer only counts as a backup initializer, so if it is all Playlist has, then Playlist inherits initializers from NSManagedObject
    convenience init?(name:String, context:NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Playlist", in: context) else {return nil}
        
        self.init(entity: entity, insertInto:context)
        
        self.name = name
    }
    
}
