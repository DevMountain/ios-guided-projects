//
//  PlaylistController.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "Playlist.h"

@interface PlaylistController : NSObject

+(PlaylistController *)sharedInstance;
-(instancetype)init;

@property (strong, nonatomic) NSMutableArray *playlists;

-(void)createPlaylistWithTitle:(NSString *)title;
-(void)addSongWithTitle:(NSString *) title andArtist:(NSString*) artist toPlaylist:(Playlist *)playlist;
-(void)deleteSong:(Song *)song fromPlaylist:(Playlist *)playlist;
-(void)deletePlaylist:(Playlist *)playlist;

@end
