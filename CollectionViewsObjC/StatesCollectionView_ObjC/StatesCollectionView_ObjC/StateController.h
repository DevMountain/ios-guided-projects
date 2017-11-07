//
//  StateController.h
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateController : NSObject

@property (nonatomic, readonly) NSArray *states;

+ (StateController *)sharedInstance;

@end
