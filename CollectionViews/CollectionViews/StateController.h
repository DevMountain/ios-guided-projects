//
//  StateController.h
//  CollectionViews
//
//  Created by Andrew Madsen on 5/24/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateController : NSObject

@property (class, readonly) StateController *sharedController;

@property (readonly, strong) NSArray *states;

@end
