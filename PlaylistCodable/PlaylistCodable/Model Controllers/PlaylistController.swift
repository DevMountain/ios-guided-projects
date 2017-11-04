//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let shared = PlaylistController()
    
    init() {
        playlists = loadFromPersistentStore()
    }
    
    func add(playlistWithName name: String) {
        let playlist = Playlist(name: name, songs: [])
        playlists.append(playlist)
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        guard let index = playlists.index(of: playlist) else { return }
        playlists.remove(at: index)
        saveToPersistentStore()
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "playlists.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let je = JSONEncoder()
        do {
            let data =  try je.encode(playlists)
            print(data)
            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving playlist \(error)")
        }
    }
    
    func loadFromPersistentStore() -> [Playlist] {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let playlists = try jd.decode([Playlist].self, from: data)
            return playlists
        } catch let error {
            print("Error loading data from disk \(error)")
        }
        return []
    }
    
    // MARK: - Properties
    
    var playlists = [Playlist]()
}
