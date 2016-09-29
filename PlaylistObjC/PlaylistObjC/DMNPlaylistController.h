//
//  PlaylistController.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMNSong.h"
#import "DMNPlaylist.h"

@interface DMNPlaylistController : NSObject

+ (DMNPlaylistController *)sharedInstance;
- (instancetype)init;

- (void)createPlaylistWithTitle:(NSString *)title;
- (void)addSongWithTitle:(NSString *) title andArtist:(NSString*) artist toPlaylist:(DMNPlaylist *)playlist;
- (void)deleteSong:(DMNSong *)song fromPlaylist:(DMNPlaylist *)playlist;
- (void)deletePlaylist:(DMNPlaylist *)playlist;

@property (nonatomic, strong, readonly) NSArray *playlists;

@end
