Pokedex teaches students how to use `GET` to get information from a REST API by building a simple Pokedex app that accesses the [pokéapi.co](https://pokeapi.co) API.

# Suggested breakdown for Pokedex

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
2. Discuss the importance of understanding the API before jumping into code. Go to the API Documentation do the necessary research. (Remember, the students have never seen this API so treat it like it's your first time seeing it as well.) Find your sample endpoint and observe the JSON. Decide now what properties you'll want to display for each pokemon.
3. Set up your views in storyboard.
4. Create your `PokemonSearchViewController.swift` file and create your outlets.
5. Create your `Pokemon` struct with the properties decided on earlier. This is prime time to talk about some of the nuances of Codable. Take time to help students understand how to parse down through the nested JSON in order to access the properties they are trying to get.
6. Write `PokemonController` and write its `fetchPokemon()` method which uses a `URLSession dataTask` to access the Pokedex API. Again, talk about what `JSONDecoder` is doing here.
7. Make `PokemonSearchViewController.swift` conform to UISearchBarDelegate. Implement `searchBarSearchButtonClicked(_:)` to search for a Pokemon, then update the labels with the results.
8. Everyone's app should be working.

_Possible issues: Bad url, model isn't properly contructed to decode, not calling .resume() on the dataTask, not calling completion(), not coming back to the main thread, not setting the delegate of the searchBar, not adding AppTransportSecurity -> allowArbitraryLoads to the info.plist_
