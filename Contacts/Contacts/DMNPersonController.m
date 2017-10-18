//
//  DMNPersonController.m
//  Contacts
//
//  Created by Andrew R Madsen on 8/17/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNPersonController.h"

@interface DMNPersonController ()

@property (nonatomic, retain) NSMutableArray *internalPeople;

@end

@implementation DMNPersonController

+ (instancetype)sharedController
{
	static DMNPersonController *sharedController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedController = [[[self class] alloc] init];
	});
	return sharedController;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		_internalPeople = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[_internalPeople release];
	
	[super dealloc];
}

- (void)addPerson:(DMNPerson *)person
{
	[self.internalPeople addObject:person];
}

- (void)deletePerson:(DMNPerson *)person
{
	[self.internalPeople removeObject:person];
}

- (NSArray *)people
{
	return [[self.internalPeople copy] autorelease];
}

@end
