DeckOfOneCard lets students practice using closure syntax, network API documentation, and making network calls using URLSession.

# Suggested breakdown for DeckOfOneCard

*Start this project from scratch*

1. Show students the final product first so they know what they are working toward.
2. Discuss the importance of understanding the API before jumping into code. Go to the [API Documentation](deckofcardsapi.com) and do the necessary research. (Remember, the students have never seen this API so treat it like it's your first time seeing it as well.) Find your sample endpoint and observe the JSON. Decide now what properties you'll want to capture for each card.
3. Set up the views in the storyboard, explaining your constraints.
4. Create your view controller subclass. Create your outlets and action.
5. Collaborate with the students to plan out your models and controllers.
6. Create your `Card` struct with the properties decided on earlier. This is prime time to review some of the nuances of Codable. Take time to help students understand how to parse the JSON in order to access the properties they are trying to get.
7. Create the `CardController` and write its `draw(numberOfCards: ...)` method which uses a `URLSession dataTask` to access the DeckOfCards API. Take time to discuss what `JSONDecoder` is doing here.
8. From your ViewController and inside of the drawButton action call `CardController.draw(numberOfCards: ...)` and print the results to the console to make sure your getting the cards back as expected.
9. Now write the `image(forURL url: ...)` function in the ImageController.
10. In the ViewController and inside of the completion handler of the `draw(numberOfCards: ...)` method call your `ImageController.image(forURL url: ...)` function to get the image for the card, and then display it on the screen.
11. Everyone's app should be working now.

_Possible issues: Bad url, model isn't properly constructed to decode, not calling .resume() on the dataTask, not calling completion() or calling it in the wrong place, not coming back to the main thread to update the UI_
