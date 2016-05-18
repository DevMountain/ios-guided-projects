//
//  EntryController.swift
//  Journal
//
//  Created by Caleb Hicks on 10/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    static let sharedController = EntryController()
    
    var entries: [Entry] = []
    
    func addEntry(title: String, text: String, isHappy: Bool) {
        let _ = Entry(title: title, text: text, isHappy: isHappy)
        saveToPersistentStorage()
        entries = fetchEntries()
    }
    
    func updateEntry(entry: Entry, title: String, text: String, isHappy: Bool) {
        entry.title = title
        entry.text = text
        entry.happy = isHappy
        saveToPersistentStorage()
        entries = fetchEntries()
    }
    
    func removeEntry(entry: Entry) {
        
        entry.managedObjectContext?.deleteObject(entry)
        saveToPersistentStorage()
        entries = fetchEntries()
    }
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    func fetchEntries() -> [Entry] {
        let request = NSFetchRequest(entityName: "Entry")
        
        do {
            return try Stack.sharedStack.managedObjectContext.executeFetchRequest(request) as! [Entry]
        } catch {
            return []
        }
    }
    
}