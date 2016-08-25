//
//  PlaylistDetailViewController.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMNPlaylist.h"

@interface DMNPlaylistDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) DMNPlaylist *playlist;

@end
