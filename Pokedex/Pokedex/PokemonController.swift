//
//  PokemonController.swift
//  Pokedex
//
//  Created by Nicholas Laughter on 1/3/17.
//  Copyright © 2017 Nicholas Laughter. All rights reserved.
//

import Foundation

class PokemonController {
    
    static func fetchPokemon(withSearchTerm searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        let searchURL = Keys.baseURL + searchTerm.lowercased()
        guard let url = URL(string: searchURL) else { completion(nil); return }
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            if let error = error { fatalError("Error getting data. \(error.localizedDescription)") }
            guard let data = data,
            let jsonDictionary = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            else { completion(nil); return }
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon)
        }
    }
}
