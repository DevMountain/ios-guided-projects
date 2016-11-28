//
//  DMNPokemon.h
//  PokedexHybrid
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNPokemon : NSObject

- (instancetype)initWithName:(NSString *)name
				  identifier:(NSInteger)identifier
				   abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

@end

// MARK: -

@interface DMNPokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
