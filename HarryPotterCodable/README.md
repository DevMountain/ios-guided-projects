HarryPotterCodable teaches students how to use GET to get information from a REST API by building a simple Pokedex app that accesses [Harry Potter API](https://hp-api.herokuapp.com/) . It will also go over decoding this data using a `JSONDecoder`.

# Suggested breakdown for HarryPotterCodable

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
2. Go to API documentation to decide what url you will need to fetch all characters from the API.
3. Use that url to show students what json data will be coming back. Decide which properties your model will have.
4. Set up your views in storyboard.
5. Create your ViewController subclasses and create your outlets.
6. Create your `Character` (being careful to name your properties carefully). This is a great time to show them how `CodingKeys` can help when JSON keys aren't what we want to use as our property names.
7. Write `CharacterController` and write its `fetchPokemon()` method which uses a URLSession `dataTask` to access the Pokedex API.
8. Add a variable to hold the `[Character]`. Then, implement the `UITableViewControllerDataSource` functions to populate a tableView with the returned characters.
9. Implement the `CharacterDetailViewController` to display the character that is tapped in the TableView.
10. Everyone's app should function as expected. Fix any problems as a group.