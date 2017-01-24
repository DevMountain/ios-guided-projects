DeckOfOneCard lets students practice using closure syntax, network API documentation, and making network calls using URLSession.

**Look over the README in the root folder of this repository**

# Suggested breakdown for DeckOfOneCard

1. Show students the final product first so they know what they are working toward.
1. Set up the view in storyboard, explaining your constraints.
2. Create your view controller subclasses, create your outlets and actions.
3. Review deckofcardsapi.com with your students so they know what to include in their model object.
3. Collaborate with the students to plan out your models and controllers
4. Create your model object including its failable initializer.
4. Create your classes with their function signatures.
5. Turn your attention to the `NetworkController`. This is the first time students have worked with URLs and URL requests, so please take some time to teach how URLs work in general. This is also the first time students will need to use `URLSession` and `URLRequest`, so consider having students work together to look at documentation and learn about the API.
6. Fill in the body of your `performRequest(for url: ...)` function, explaining what you are doing and why. You will just give them the `url(byAdding parameters: ...)` function. Make sure students understand conceptually what is happening. After the students have also done this, make sure you and everyone tests their function by calling it from your first ViewController's `viewDidLoad()` to see if it is getting data.
9. Turn your attention to your CardController and its `draw(numberOfCards: ...)` function. Fill it in and take time to explain how to parse a json. This is hard for people so feel free to spend a good chunk of time practicing this.
10. From your ViewController call `CardController.draw(numberOfCards: ...)` and print it out to make sure it works.
11. Fill in the `ImageController.image(forURL url: ...)` function.
12. From your ViewController inside the closure for `CardController.draw(numberOfCards: ...)` use your `ImageController.image(forURL url: ...)` function to get the image for the card, and then display it on the screen. Everyone's app should be working now.

