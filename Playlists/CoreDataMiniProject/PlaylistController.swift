//
//  PlaylistController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    var myPlaylists: [Playlist] {
        
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext

        return (try? moc.executeFetchRequest(request)) as? [Playlist] ?? []
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
    
    func createPlaylist(name: String) {
        let _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    // TEACHING NOTE: - deletes playlist from managed object context, after which you need to save to persistent store to make permanent
    func removePlaylist(playlist: Playlist) -> () {
        if let moc = playlist.managedObjectContext {
            moc.deleteObject(playlist)
            saveToPersistentStore()
        }
    }
    
    // TEACHING NOTE: - deleting a song from the managed object context automatically deletes it from the playlist because of the relationship we set up in the model
    func removeSongFromPlaylist(song: Song) {
        if let moc = song.managedObjectContext {
            moc.deleteObject(song)
            saveToPersistentStore()
        }
    }
    
    // TEACHING NOTE: - initializing a song automatically adds it to a playlist because of the relationship we set up in the model
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        saveToPersistentStore()
    }
    
    
}