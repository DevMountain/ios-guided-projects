//
//  PokemonSearchViewController.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 Michael Mecham. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		guard let searchTerm = searchBar.text else { return }
		PokemonController.fetchPokemon(searchTerm) { (pokemon) in
			dispatch_async(dispatch_get_main_queue()) {
				guard let pokemon = pokemon else { return }
				self.nameLabel.text = pokemon.name.capitalizedString
				self.idLabel.text = "ID: \(pokemon.id)"
				self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joinWithSeparator(", "))"
			}
		}
	}
	
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var abilitiesLabel: UILabel!
}
