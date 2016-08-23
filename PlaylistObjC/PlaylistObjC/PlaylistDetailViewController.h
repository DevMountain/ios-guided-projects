//
//  PlaylistDetailViewController.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Playlist.h"

@interface PlaylistDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Playlist *playlist;

@end
