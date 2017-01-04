//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Nicholas Laughter on 1/3/17.
//  Copyright © 2017 Nicholas Laughter. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var pokemonSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonSearchBar.backgroundImage = UIImage()
        nameLabel.text = nil
        pokemonIDLabel.text = nil
        abilitiesLabel.text = nil

        searchForPokemon()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchForPokemon()
    }
    
    func searchForPokemon() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let searchTerm = pokemonSearchBar.text != "" ? pokemonSearchBar.text! : "slowpoke"
        PokemonController.fetchPokemon(withSearchTerm: searchTerm) { (pokemon) in
            DispatchQueue.main.async {
                guard let pokemon = pokemon else { return }
                ImageController.getImage(atURL: pokemon.spriteURLString, completion: { (image) in
                    self.nameLabel.text = pokemon.name.capitalizingFirstLetter()
                    self.pokemonIDLabel.text = pokemon.pokeID
                    self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
                    self.pokemonImageView.image = image
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                })
            }
        }
    }
}
