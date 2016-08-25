//
//  Playlist.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "Playlist.h"

@interface Playlist ()

@property (nonatomic, strong) NSMutableArray *internalSongs;

@end

@implementation Playlist

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

#pragma mark - Properties

- (NSArray *)songs { return self.internalSongs; }

- (void)addSongsObject:(Song *)song;
{
	[self.internalSongs addObject:song];
}

- (void)removeSongsObject:(Song *)song;
{
	[self.internalSongs removeObject:song];
}

@end
