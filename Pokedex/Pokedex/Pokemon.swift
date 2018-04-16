//
//  Pokemon.swift
//  JSONPokedex

import UIKit

struct Pokemon: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case abilities
        case sprites
    }
    
    let name: String
    let id: Int
    var image: UIImage? = nil
    let abilities: [AbilityDictionary]
    let sprites: Sprites
    
    var abilitiesNames: [String] {
        return abilities.compactMap( { $0.ability.name })
    }
    
    struct Sprites: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case frontImageEndpoint = "front_default"
        }
        
        let frontImageEndpoint: String
    }
    
    struct AbilityDictionary: Decodable {
        let ability: Ability
        
        struct Ability: Decodable {
            let name: String
        }
    }
}

