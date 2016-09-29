//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedInstance = PlaylistController()
    
    var playlists: [Playlist] {
        
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        return (try? moc.fetch(request)) as? [Playlist] ?? []
    }
    
    func addPlaylist(_ name: String) {
        let _ = Playlist(name: name)
    }
    
    func deletePlaylist(_ playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("There was a problem saving to persistent store")
        }
    }
    
}