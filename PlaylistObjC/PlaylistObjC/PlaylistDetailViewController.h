//
//  PlaylistDetailViewController.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Playlist.h"

@interface PlaylistDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Playlist *playlist;

@end
