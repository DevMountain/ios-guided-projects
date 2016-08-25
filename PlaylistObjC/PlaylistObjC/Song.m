//
//  Song.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "Song.h"

@implementation Song

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
	if (![object isKindOfClass:[Song class]]) { return NO; }
	Song *song = object;
	if (![song.title isEqualToString:self.title] && song.title != self.title) { return NO; }
	if (![song.artist isEqualToString:self.artist] && song.artist != self.artist) { return NO; }
	return YES;
}

@end
