//
//  DMNPerson.m
//  Contacts
//
//  Created by Andrew R Madsen on 8/17/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNPerson.h"

@implementation DMNPerson

- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber
{
	self = [super init];
	if (self) {
		_name = [name retain];
		_phoneNumber = [phoneNumber retain];
	}
	return self;
}

- (void)dealloc
{
	[_name release];
	[_phoneNumber release];
	
	[super dealloc];
}

@end
