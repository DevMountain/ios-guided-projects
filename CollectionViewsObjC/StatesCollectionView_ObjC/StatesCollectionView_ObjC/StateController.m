//
//  StateController.m
//  StatesCollectionView_ObjC
//
//  Created by Aaron Martinez on 3/15/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

#import "StateController.h"
#import "StateHelper.h"
#import "State.h"

@interface StateController ()

@property (nonatomic, readwrite) NSArray *states;

@end

@implementation StateController

+ (StateController *)sharedInstance
{
    static StateController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [StateController new];
    });
    return shared;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        _states = [self createAllStates];
    }
    return self;
}

- (NSArray *)createAllStates {
    
    NSMutableArray *placeHolderStates = [[NSMutableArray alloc] init];
    for (NSString *stateFullName in [StateHelper fullNames]) {
         NSUInteger index = [[StateHelper fullNames] indexOfObject:stateFullName];
        NSString *abbreviation = [StateHelper abbreviations][index];
        State *state = [[State alloc] initWithName:stateFullName abbreviation:abbreviation];
        [placeHolderStates addObject:state];
    }
    return placeHolderStates;
}



@end
