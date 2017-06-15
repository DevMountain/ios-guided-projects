//
//  PokemonController.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let searchURL = baseURL?.appendingPathComponent(searchTerm.lowercased()) else {
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: searchURL) { (data, _, error) in
            
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String:AnyObject] else {
                    completion(nil)
                    return
            }
            
            let pokemon = Pokemon(dictionary: jsonDictionary)
            
            completion(pokemon)
        }
        
        dataTask.resume()
    }
}
