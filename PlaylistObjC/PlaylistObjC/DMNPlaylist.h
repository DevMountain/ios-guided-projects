//
//  Playlist.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNSong;

@interface DMNPlaylist : NSObject

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSArray *songs;
- (void)addSongsObject:(DMNSong *)song;
- (void)removeSongsObject:(DMNSong *)song;

@end
