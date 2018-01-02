//
//  PokemonSearchViewController.swift
//  JSONPokedex
//
//  Created by Michael Mecham on 7/12/16.
//  Copyright © 2016 Michael Mecham. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else { return }
        
        PokemonController.shared.fetchPokemon(for: searchTerm) { (pokemon) in
            
            guard let pokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon.name.capitalized
                self.idLabel.text = "ID: \(pokemon.id)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilitiesNames.joined(separator: ", "))"
            }
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
}
