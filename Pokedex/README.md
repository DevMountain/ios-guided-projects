Pokedex teaches students how to use GET to get information from a REST API by building a simple Pokedex app that acess the [pokéapi.co](https://pokeapi.co) API.

# Suggested breakdown for Pokedex

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
2. Set up your views in the storyboard.
3. Create your ViewController subclasses and create your outlets and actions.
4. Create your `Pokemon` struct with its dictionary initializer.
5. Write `NetworkController`. Explain why we write a generic network controller, and that it could be reused in other apps.
6. Write `PokemonController` and write its `fetchPokemon()` method which uses the `NetworkController` to access the Pokedex API.
7. Create `PokemonSearchViewController`, which conforms to UISearchBarDelegate. Implement `searchBarSearchButtonClicked()` to search for a Pokemon, then update the labels with the results.
8. Everyone's app should be working. 
