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
	
	static func fetchPokemon(_ searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
		let searchURL = baseURL + searchTerm.lowercased()
		let url = URL(string: searchURL)
		guard let unwrappedURL = url else {
			completion(nil)
			return
		}
		NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
			guard let data = data,
				let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String:AnyObject] else {
					completion(nil)
					return
			}
			
			let pokemon = Pokemon(dictionary: jsonDictionary)
			completion(pokemon)
		}
	}
}
