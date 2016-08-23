//
//  Song.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artist;

@end
