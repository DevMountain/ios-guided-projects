//
//  Playlist.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import "Playlist.h"

@implementation Playlist

-(instancetype)initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self) {
        _name = name;
        _songs = [songs mutableCopy];
    }
    return self;
}

@end
