//
//  PlaylistController.swift
//  Playlist
//
//  Created by James Pacheco on 5/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CloudKit

class PlaylistController {
    
    static let shared = PlaylistController()
    
    let database = CKContainer.default().privateCloudDatabase
    
    func fetchAllPlaylistsFromCloudKit(completion: @escaping () -> Void) {
        
        CloudKitManager.shared.fetchRecordsOf(type: Playlist.typeKey, database: database) { (records, error) in
            if let error = error {
                print("Error fetching playlists from CloudKit: \(error.localizedDescription)")
            }
            
            guard let records = records else { completion(); return }
            
            let playlists = records.compactMap({ Playlist(record: $0) })
            
            self.playlists = playlists
            
            completion()
        }
    }
    
    func fetchSongsFor(playlist: Playlist, completion: @escaping () -> Void) {
        
        
        let playlistRef = CKReference(record: playlist.cloudKitRecord, action: .deleteSelf)
        
        let predicate = NSPredicate(format: "playlistRef == %@", playlistRef)
        
        let songRecordIDs = playlist.songs.compactMap({$0.cloudKitRecordID })
        
        let predicate2 = NSPredicate(format: "NOT(recordID IN %@)", songRecordIDs)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, predicate2])
        
        CloudKitManager.shared.fetchRecordsOf(type: Song.typeKey, predicate: compoundPredicate, database: database) { (records, error) in
            if let error = error {
                print("Error fetching songs from CloudKit: \(error.localizedDescription)")
            }
            
            guard let records = records else { completion(); return }
            
            let songs = records.compactMap({ Song(record: $0) })
            
            playlist.songs.append(contentsOf: songs)
            
            completion()
        }
    }
    
    func add(playlistWithName name: String, completion: @escaping () -> Void) {
        
        let playlist = Playlist(name: name)
        
        CloudKitManager.shared.saveRecordToCloudKit(record: playlist.cloudKitRecord, database: database) { (record, error) in
         
            if let error = error {
                print("Error saving playlist record to CloudKit: \(error.localizedDescription)")
            } else {
                playlist.cloudKitRecordID = record?.recordID
                self.playlists.append(playlist)
            }
            
            completion()
        }
    }
    
    func delete(playlist: Playlist) {
        guard let index = playlists.index(of: playlist),
            let playlistRecordID = playlist.cloudKitRecordID else { return }
        
        self.playlists.remove(at: index)
        
        database.delete(withRecordID: playlistRecordID) { (_, error) in
            if let error = error {
                print("Error deleting playlist from CloudKit: \(error.localizedDescription)")
            }
        }
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        guard let index = playlist.songs.index(of: song),
            let songRecordID = song.cloudKitRecordID else { return }
        
        playlist.songs.remove(at: index)
        
        database.delete(withRecordID: songRecordID) { (_, error) in
            if let error = error {
                print("Error deleting song from CloudKit: \(error.localizedDescription)")
            }
        }
    }
 
	// MARK: Properties
	
	var playlists = [Playlist]()
}
