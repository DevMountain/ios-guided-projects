Playlist teaches students proper MVC design and how to use the singleton pattern.

**Look over the README in the root folder of this repository**

# Suggested breakdown for Playlist

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
2. Set up your views in storyboard in small enough segments that students can follow. Be sure to help them understand any constraints you are adding. You will need two UITableViewControllers with the first embeded in a UINavigationController.
3. Create your ViewController subclasses and create your outlets and actions.
4. Discuss MVC and why it is important. Plan out the model objects and controllers.
5. Create your `Song` object with its initializer.
6. Create your `Playlist` object with its initializer.
7. Create your `PlaylistController` and write its method signatures.
8. Create you `SongController` and write its method signatures
8. Discuss the singleton pattern and what a shared instance is. Create a shared instance with mock data for `playlists`.
9. Wire up your table view to show the mock data.
10. Implement your `prepareForSegue` function on your `PlaylistTableViewController` so that you can segue from a playlist to a list of its songs. You may need to spend a good amount of time continuing to work with the students on what is happening in this function.
10. One at a time, implement your controller functions.
11. Make sure actions in view controllers are calling the proper controller functions(s).
12. Everyone's app should be working, and they should understand the MVC and Singleton patters.