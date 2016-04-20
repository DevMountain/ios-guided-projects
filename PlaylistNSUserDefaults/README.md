PlaylistNSUserDefaults is designed to help have students practice converting model objects to dictionaries and persisting data using NSUserDefaults.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistNSUserDefaults

*Start this project from Playlist (the version without persistence), not from scratch*

1. Show students the final product first so they know what they are working toward.
1. Take a few minutes to go over the version without persistence and make sure everyone understands things like `prepareForSegue`.
2. Have students look at NSUserDefaults documentation and discuss with each other how it works and what objects it can store. This should help them reinforce the idea that you cannot store your custom objects "as-is".
4. Plan our the new methods you will need to store and load data.
3. Go to your `Song` object and create a computed property that will convert it into a dictionary.
4. Create a failable initializer for your `Song` object that will take a dictionary and convert it into a `Song` instance.
5. Repeat the last two steps for your `Playlist` object.
6. Fill in your `saveToPersistentStore` function, referencing documentation for the NSUserDefaults functions.
7. Determine where in the project you need to call `saveToPersistentStore` and add the call(s).
8. Fill in your `loadFromPersistentStore` function, referencing documentation for the NSUserDefaults functions.
9. Determine where in the project to load your data, and call `loadFromPersistentStore`. Everyone's app should work now.