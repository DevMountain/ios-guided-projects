//
//  Entry.swift
//  Journal
//
//  Created by James Pacheco on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Entry: NSManagedObject {

    convenience init(title: String, text: String, isHappy: Bool, timestamp: NSDate = NSDate(), context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Entry", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.title = title
        self.text = text
        self.timestamp = timestamp
        self.happy = isHappy
    }

}
