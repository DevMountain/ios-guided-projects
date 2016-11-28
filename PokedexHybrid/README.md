PokedexHybrid teaches students how to use Swift and Objective-C together in the same project. It has identical functionality to the original Pokedex project.

# Suggested breakdown for PokedexHybrid

*Start this project from scratch*

1. Show students the final product so they know what they are working toward. Remind them of the app from earlier in the curriculum if they've already seen it.
2. Set up your views in the storyboard. These will be identical to the Swift only version.
3. Create your ViewController subclasses and create your outlets and actions.
4. Create the `DMNPokemon` class in Objective-C. Put its dictionary initializer in a category (optional).
5. Write `NetworkController` in Swift. Explain that this is nearly identical to the network controller in Pokedex, but that we need to make it usable from Objective-C.
6. Write `DMNPokemonController` in Objective-C. Its `-fetchPokemonForSearchTerm:completion:` method should use the `NetworkController` to access the Pokedex API.
7. Create `PokemonSearchViewController`, which conforms to UISearchBarDelegate. Implement `searchBarSearchButtonClicked()` to search for a Pokemon, then update the labels with the results. This is identical to the original Pokedex version.
8. Everyone's app should be working. 
