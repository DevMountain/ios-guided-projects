DeckOfOneCard lets students practice using closure syntax, network API documentation, and making network calls using NSURLSession.

**Look over the README in the root folder of this repository**

# Suggested breakdown for DeckOfOneCard

Please show the finished product to students first so they know what they are building.

1. Set up the view in storyboard, explaining your constraints.
2. Create your view controller subclasses, create your outlets and actions.
3. Review deckofcardsapi.com with your students so they know what to include on their model object.
3. Collaborate with the students to plan out your models and controllers
4. Create your model object, including its failable initializer.
4. Create your classes with their function signatures.
5. Turn your attention to the `NetworkController` and its `dataAtURL` function. This is the first time the students will need to use NSURLSession, so consider having students work together to look at documentation and learn about the API.
6. Fill in the body of your `dataAtURL` function, explaining what you are doing and why. Make sure students understand conceptually what is happening. After the students have also done this, make sure you and everyone tests their function by calling it from your first ViewController's `viewDidLoad` to see if it is getting data.
8. Fill in the body of your `jsonFromData` function.
9. Turn your attention to your CardController and its `drawCard` function. Fill it in and take time to explain how to parse a json. This is hard for people so feel free to spend a good chunk of time practicing this.
10. From your ViewController call `CardController.drawCard` and print it out to make sure it works.
11. Fill in the `ImageController.imageForURL` function.
12. From your ViewController inside the closure for `CardController.drawCard` use your `ImageController.imageForURL` function to get the image for the card, and then display it on the screen. Everyone's app should be working now.