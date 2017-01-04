//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nicholas Laughter on 1/3/17.
//  Copyright © 2017 Nicholas Laughter. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let pokeID: String
    let abilities: [String]
    let spriteURLString: String
}

extension Pokemon {
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Keys.nameKey] as? String,
            let pokeIDInt = dictionary[Keys.pokeIDKey] as? Int,
            let abilitiesArray = dictionary[Keys.abilitiesKey] as? [[String: AnyObject]],
            let spritesDictionary = dictionary[Keys.spritesKey] as? [String: Any],
            let spriteURLString = spritesDictionary[Keys.spriteURLKey] as? String else { return nil }
        let abilities = abilitiesArray.flatMap { $0[Keys.abilityKey]?[Keys.nameKey] as? String }
        let pokeID = String(pokeIDInt)
        
        self.name = name
        self.pokeID = pokeID
        self.abilities = abilities
        self.spriteURLString = spriteURLString
    }
}
