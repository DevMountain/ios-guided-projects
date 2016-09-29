//
//  DMNPokemonController.h
//  PokedexHybrid
//
//  Created by Andrew Madsen on 9/29/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNPokemon;

NS_ASSUME_NONNULL_BEGIN

@interface DMNPokemonController : NSObject

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^_Nullable)(DMNPokemon * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
