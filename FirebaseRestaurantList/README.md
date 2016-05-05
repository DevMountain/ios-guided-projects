FirebaseRestaurantList is designed to teach students how to store data in Firebase and observe changes to that data.

**Look over the README in the root folder of this repository**

# Suggested breakdown for FirebaseRestaurantList

*Start this project from the branch titled projectStarts*

1. Send out the starting project to everyone, and briefly go through it together (both the app and the code) to make sure everyone understands the project. In the starting state, there is no persistence. You will be adding persistence using Firebase.
2. Show everyone the Firebase site and where the docs are. They should already have an account after watching the preclass, but make sure everyone has an account and knows how to make a new app in the dashboard.
3. Walk through adding the Firebase framework to your project.
4. Create a FirebaseController that creates a static instance of a `Firebase` object with a url that everyone can use to add restaurants to the same list. That's all it will need for now.
5. Create a FirebaseType protocol that requires a variable for endpoint, identifier, and jsonValue, and a failable initializer that takes a dictionary and identifier and then initializes a Restaurant object. Leave off the save and delete functions for now.
6. Make your `Restaurant` model object conform to FirebaseType.
6. Turn to the RestaurantController. Create an `addRestaurantToFirebase` function. This should add the restaurant's endpoint to the `FirebaseController.base` using `childByAppendingPath`, then use `childByAutoID` to create the restaurant's identifier, and use `setValue` to set the restaurant's jsonValue at the new endpoint. Instead of adding your restaurant to the `sharedInstance.restaurants` array, call your new `addResetarauntToFirebase` function (we don't want to add to the array because we will be using a Firebase observe function to set the array's value so that it always reflects what is in Firebase). You should now show how the app will not add items to the UI, but will add items in Firebase.
7. Mention that if you had more model objects and each of them conformed to FirebaseType, then the `addToFirebase` function for each would look identical. In this case, you can add a save function to the FirebaseType protocol and use a protocol extension to fill in the body of the save function in such a way that it will work across all model object conforming to FirebaseType. Now change your `addRestaurantToFirebase` function in your `RestaurantController` so it calls `restaurant.save()`.
8. Go ahead and add a delete function to the protocol and protocol extension. You will need to call this from your `RestaurantController.deleteRestaurant` function.
9.  Talk about the Firebase observing functions. Create your `observeRestaurants` function on your `RestaurantController`, pointing out the similarities to parsing through jsons in network calls. Call this from your `RestaurantController` initializer and set the `sharedInstance.restaurants` array.
10. Now you need a way to let the view controller know that it shoud update the UI. Where you set the array, also send a notification. In the view controller's `viewDidLoad` add the view controller as an observer to this notification and call a function that will reload the tableView. You no longer need to reload your tableView in your alert action since it will reload when it fetches changes from Firebase. In this way, our list always reflects the persistent store in Firebase.
