//
//  Song.h
//  PlaylistObjC
//
//  Created by James Pacheco on 4/21/16.
//  Copyright © 2016 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *artist;

-(instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist;

@end
