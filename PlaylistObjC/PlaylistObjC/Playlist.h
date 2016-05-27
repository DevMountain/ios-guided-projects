//
//  Playlist.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Playlist : NSObject

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *songs;

-(instancetype)initWithName:(NSString *)name songs:(NSArray *)songs;

@end
