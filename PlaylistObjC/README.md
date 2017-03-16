PlaylistObjC teaches students the basics of Objective-C by making the same playlist app they have previously made only using Objective-C.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistObjC

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
2. Set up your views in storyboard.
3. Create your ViewController subclasses and create your outlets and actions.
	* Explain that outlets will be in `@interface` and actions will be in `@implementation` because outlets are properties and actions are functions 
5. Create your `DMNSong` object with its initializer. Note that you need to initialize the NSObject superclass inside the initializer, and check to make sure that self is not nil because all initializers are failable in Objective-C.
6. Have the students try to make the `DMNPlaylist` object and initializer independently, then go over it and continue to review the things that are different about Objective-C.
7. Write your `DMNPlaylistController` method signatures.
8. Talk about how shared instances in Objective-C are created using a method rather than a static property. Create a shared instance. Help students make a snippet.
9. Implement your tableView dataSource functions.
10. One at a time, implement your controller functions.
11. Implement your actions in the view controllers to call your `DMNPlaylistController` functions. Be sure to reload your table view when needed.
12. Everyone's app should be working, and they should understand the basics of Objective-C.
