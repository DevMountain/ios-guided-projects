//
//  PokemonController.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class PokemonController {
	
	static let baseURL = "http://pokeapi.co/api/v2/pokemon/"
	
	static func fetchPokemon(searchTerm: String, completion: (pokemon: Pokemon?) -> Void) {
		let searchURL = baseURL + searchTerm.lowercaseString
		let url = NSURL(string: searchURL)
		guard let unwrappedURL = url else {
			completion(pokemon: nil)
			return
		}
		NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
			guard let data = data,
				jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String:AnyObject] else {
					completion(pokemon: nil)
					return
			}
			
			let pokemon = Pokemon(dictionary: jsonDictionary)
			completion(pokemon: pokemon)
		}
	}
}