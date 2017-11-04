//
//  StateController.m
//  CollectionViews
//
//  Created by Andrew Madsen on 5/24/17.
//  Copyright © 2017 Spencer Curtis. All rights reserved.
//

#import "StateController.h"
#import "CollectionViews-Swift.h"

@implementation StateController

+ (StateController *)sharedController
{
	static StateController *sharedController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedController = [[self alloc] init];
	});
	return sharedController;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		_states = [self createAllStates];
	}
	return self;
}

- (NSArray *)createAllStates
{
	NSMutableArray *placeholderStates = [[NSMutableArray alloc] init];
	
	for (NSString *stateFullName in StateHelper.fullNames) {
		NSInteger index = [StateHelper.fullNames indexOfObject:stateFullName];
		NSString *abbreviation = StateHelper.abbreviations[index];
		State *state = [[State alloc] initWithName:stateFullName abbreviation:abbreviation];
		[placeholderStates addObject:state];
	}
	return placeholderStates;
}

@end






