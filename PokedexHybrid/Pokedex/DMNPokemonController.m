//
//  DMNPokemonController.m
//  PokedexHybrid
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

#import "DMNPokemonController.h"
#import "PokedexHybrid-Swift.h"
#import "DMNPokemon.h"

static NSString * const baseURLString = @"http://pokeapi.co/api/v2/pokemon/";

@implementation DMNPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion
{
	if (!completion) { completion = ^(DMNPokemon *p){ }; } // Ensure that completion is not nil
	
	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
	
	[NetworkController performRequestFor:searchURL
						httpMethodString:@"GET"
						   urlParameters:nil
									body:nil
							  completion:^(NSData *data, NSError *error) {
								  if (error) {
									  NSLog(@"Error getting Pokemon for %@: %@", searchTerm, error);
									  completion(nil);
									  return;
								  }
								  
								  NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
								  if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
									  NSLog(@"Error parsing json: %@", error);
									  completion(nil);
									  return;
								  }
								  
								  DMNPokemon *pokemon = [[DMNPokemon alloc] initWithDictionary:dictionary];
								  completion(pokemon);
							  }];
}

@end
