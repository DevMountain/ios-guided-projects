//
//  DMNPokemon.m
//  PokedexHybrid
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

#import "DMNPokemon.h"

@implementation DMNPokemon

// -init must be overridden since it's the designated initializer for the super class
- (instancetype)init
{
	return [self initWithName:@"" identifier:0 abilities:@[]];
}

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
	self = [super init];
	if (self) {
		_name = [name copy];
		_identifier = identifier;
		_abilities = [abilities copy];
	}
	return self;
}

@end

// MARK: - JSONConvertible

@implementation DMNPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
	NSString *name = dictionary[@"name"];
	NSInteger identifier = [dictionary[@"id"] integerValue];
	NSArray *abilityDictionaries = dictionary[@"abilities"];
	
	if (![name isKindOfClass:[NSString class]] ||
		![abilityDictionaries isKindOfClass:[NSArray class]]) {
		return nil;
	}
	
	NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
	for (NSDictionary *dictionary in abilityDictionaries) {
		NSString *abilityName = dictionary[@"ability"][@"name"];
		if (!abilityName) { continue; }
		[abilities addObject:abilityName];
	}
	
	return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
