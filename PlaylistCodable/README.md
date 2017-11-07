PlaylistCodable is designed to introduce students to the codable protocol.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistCodable

*Start this project from Playlist (the version without persistence), not from scratch*

1. Show students the final product first so they know what they are working toward.
2. Take a few minutes to go over the version without persistence and make sure everyone understands things like `prepare(for segue: UIStoryboardSegue, sender: Any?)`.
3. Briefly talk about persisting data in general. Why an app would need it and some of the options we have for persisting data. Talk about the idea that most of the time you cannot store your custom objects "as-is". Explain how `Codable` solves this issue.
4. Explain that for this project we will be saving our data locally. Write a function called `fileURL()` which returns the url we will be saving our data to.
5. Plan out the new methods you will need to store and load data. (`saveToPersistentStore()`, `loadFromPersistentStore()`)
6. Fill out your `saveToPersistentStore()` function using a `JSONEncoder`. (*Make sure you print out the data created by the encoder as string so that the students can see the json that is being created to hold the properties of the model objects*)
7. Determine where in the project you need to call `saveToPersistentStore()` and add the call(s). Explain why we don't actually need a `deleteFromPersistentStore()` function. How calling save at the right time instead will actually update the persistent store correctly.
8. Fill out your `loadFromPersistentStore()` function using a `JSONDecoder`.
9. Determine where in the project to load your data, and call `loadFromPersistentStore()`. Everyone's app should work now.
