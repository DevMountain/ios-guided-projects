PlaylistCoreData is designed to help students practice using Core Data and creating simple relationships between objects.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistCoreData

*Start this project from PlaylistNSUserDefaults, not from scratch*

1. Show students the final product first so they know what they are working toward.
2. Talk a little bit about the pros and cons of CoreData vs UserDefaults.
3. Discuss the Stack (Managed Object Context, Persistent Store Coordinator, Persistent Store) - ask about what they know from the video - maybe draw it out.
4. Give them the Core Data Stack file and walk through it with them. Maybe look at documentation with them or have them look at documentaion by themselves. Then have them walk through it with the person sitting next to them to see if they can explain what each portion is doing. 
5. Create a new CoreData model file and show them basic navigation through the file
6. Set up one of the model objects.
7. Set up the other model object and make sure their inverses are working properly. Make sure Playlists have a to many relationship with Song and that Song has a to one relationship with Playlist. Explain what these relationships mean.
8. If you haven't already, discuss how CoreData works with NSManagedObjects and explain that for our models to work with CoreData they need to be subclasses of NSManagedObject. Explain that Xcode creates the class files for our model objects automatically.
9. Set up a convenience initializer for Playlist.
10. Set up a convenience initializer for Song.
11. One by one, work with the students to fix all of your functions that worked with UserDefaults to now work with CoreData. Be sure to do it in small enough segments that they can follow. Then have them do each step independently and then do it again as a group.
