//
//  Song.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init];
    if (self) {
        self.title = title;
        self.artist = artist;
    }
    return self;
}

@end
