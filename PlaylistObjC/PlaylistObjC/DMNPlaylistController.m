//
//  PlaylistController.m
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import "DMNPlaylistController.h"

@interface DMNPlaylistController ()

@property (nonatomic, strong) NSMutableArray *internalPlaylists;

@end

@implementation DMNPlaylistController

+ (DMNPlaylistController *)sharedInstance
{
	static DMNPlaylistController *sharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [DMNPlaylistController new];
	});
	return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createPlaylistWithTitle:(NSString *)title
{
    DMNPlaylist *playlist = [[DMNPlaylist alloc] initWithName:title songs:[[NSMutableArray alloc] init]];
    [self.internalPlaylists addObject:playlist];
}

- (void)deletePlaylist:(DMNPlaylist *)playlist
{
    [self.internalPlaylists removeObject:playlist];
}

- (void)addSongWithTitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(DMNPlaylist *)playlist
{
    DMNSong *song = [[DMNSong alloc] initWithTitle:title artist:artist];
	[playlist addSongsObject:song];
}

- (void)deleteSong:(DMNSong *)song fromPlaylist:(DMNPlaylist *)playlist
{
	[playlist removeSongsObject:song];
}

#pragma mark - Properties

- (NSArray *)playlists { return self.internalPlaylists; }

@end
