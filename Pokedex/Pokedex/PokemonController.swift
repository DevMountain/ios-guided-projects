//
//  PokemonController.swift
//  JSONPokedex


import UIKit

class PokemonController {
    
    static let shared = PokemonController()
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")!
    
    func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        let searchURL = PokemonController.baseURL.appendingPathComponent(searchTerm.lowercased())
        
        URLSession.shared.dataTask(with: searchURL) { (data, _, error) in
            
            if let error = error {
                print("There was an error fetching the pokemon: Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return }
            do {
                let jsonDecoder = JSONDecoder()
                var pokemon = try jsonDecoder.decode(Pokemon.self, from: data)
                
                guard let imageURL = URL(string: pokemon.sprites.frontImageEndpoint) else { completion(nil); return }
                
                self.fetchImage(at: imageURL) { (image) in
                    guard let image = image else { completion(nil); return }
                    pokemon.image = image
                    completion(pokemon)
                }
            } catch {
                print("There was an error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchImage(at url: URL, completion: @escaping(UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("There was an error fetching the pokemon's image: Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else { completion(nil); return }
            completion(image)
            }.resume()
    }
}

