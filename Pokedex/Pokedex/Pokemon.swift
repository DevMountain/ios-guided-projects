//
//  Pokemon.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Pokemon {
    
    private let nameKey = "name"
    private let idKey = "id"
    private let abilitiesKey = "abilities"
    private let abilityKey = "ability"
    private let abilityNameKey = "name"
    
    init(name: String, id: Int, abilities: [String]) {
        self.name = name
        self.id = id
        self.abilities = abilities
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let name = dictionary[nameKey] as? String,
            let id = dictionary[idKey] as? Int,
            let abilityDictionaries = dictionary[abilitiesKey] as? [[String:AnyObject]] else {
                return nil
        }
        
        var abilities: [String] = []
        
        for abilityDictionary in abilityDictionaries {
            
            guard let abilityNameDictionary = abilityDictionary[abilityKey] as? [String: String],
                let ability = abilityNameDictionary[abilityNameKey] else { break }
            
            abilities.append(ability)
        }
        
        self.name = name
        self.id = id
        self.abilities = abilities
        
    }
    
    let name: String
    let id: Int
    let abilities: [String]
}

