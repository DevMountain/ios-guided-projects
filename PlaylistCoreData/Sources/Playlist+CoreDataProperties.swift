//
//  Playlist+CoreDataProperties.swift
//  PlaylistCoreData
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Playlist> {
        return NSFetchRequest<Playlist>(entityName: "Playlist");
    }

    @NSManaged public var name: String?
    @NSManaged public var songs: NSOrderedSet?

}

// MARK: Generated accessors for songs
extension Playlist {

    @objc(insertObject:inSongsAtIndex:)
    @NSManaged public func insertIntoSongs(_ value: Song, at idx: Int)

    @objc(removeObjectFromSongsAtIndex:)
    @NSManaged public func removeFromSongs(at idx: Int)

    @objc(insertSongs:atIndexes:)
    @NSManaged public func insertIntoSongs(_ values: [Song], at indexes: NSIndexSet)

    @objc(removeSongsAtIndexes:)
    @NSManaged public func removeFromSongs(at indexes: NSIndexSet)

    @objc(replaceObjectInSongsAtIndex:withObject:)
    @NSManaged public func replaceSongs(at idx: Int, with value: Song)

    @objc(replaceSongsAtIndexes:withSongs:)
    @NSManaged public func replaceSongs(at indexes: NSIndexSet, with values: [Song])

    @objc(addSongsObject:)
    @NSManaged public func addToSongs(_ value: Song)

    @objc(removeSongsObject:)
    @NSManaged public func removeFromSongs(_ value: Song)

    @objc(addSongs:)
    @NSManaged public func addToSongs(_ values: NSOrderedSet)

    @objc(removeSongs:)
    @NSManaged public func removeFromSongs(_ values: NSOrderedSet)

}
