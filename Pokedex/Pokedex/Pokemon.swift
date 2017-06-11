//
//  Pokemon.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let id: Int
    let abilities: [String]
}

extension Pokemon {
    
    private static var nameKey: String { return "name" }
    private static var idKey: String { return "id" }
    private static var abilitiesKey: String { return "abilities" }
    private static var abilityKey: String { return "ability" }
    private static var abilityNameKey: String { return "name" }
    
    init?(dictionary: [String:AnyObject]) {
        guard let name = dictionary[Pokemon.nameKey] as? String,
            let id = dictionary[Pokemon.idKey] as? Int,
            let abilityDictionaries = dictionary[Pokemon.abilitiesKey] as? [[String:AnyObject]] else {
                return nil
        }
        
        var abilities: [String] = []
        
        for abilityDictionary in abilityDictionaries {
            
            guard let abilityNameDictionary = abilityDictionary[Pokemon.abilityKey] as? [String: String],
                let ability = abilityNameDictionary[Pokemon.abilityNameKey] else { break }
            
            abilities.append(ability)
        }
        
        self.name = name
        self.id = id
        self.abilities = abilities
        
    }
}
