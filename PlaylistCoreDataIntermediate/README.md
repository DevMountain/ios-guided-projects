PlaylistCoreData is designed to help have students practice using Core Data and creating simple relationships between objects.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistCoreData

*Start this project from PlaylistNSUserDefaults, not from scratch*

1. Show students the final product first so they know what they are working toward.
1. Talk a little bit about the pros and cons of CoreData vs NSUserDefaults.
2. Discuss the Stack (PersistentStoreCoordinator, ManagedObjectContext, Model) - ask about what they know from the video - maybe draw it out.
3. Give them the stack file and walk through it with them. Maybe look at some documentation with them or have them look at documentaion. Then have them walk through it with the person sitting next to them to see if they can explain what each portion is doing. 
4. Create a new CoreData model file and show them basic navigation through the file
5. Set up one of the model objects.
6. Set up the other model object and make sure their inverses are working properly. Make sure Playlists have a to many relationship with Song and that Song has a to one relationship with Playlist. Explain what these relationships mean.
7. If you haven't already, discuss how CoreData works with NSManagedObjects, and explain that for our models to work with CoreData, they need to be subclasses of NSManagedObject. Then generate your NSManagedObject subclasses. (Make sure to check your properties for optionals that shouldn't be there - CoreData automatically makes everything optional, even if you unchecked optional in the model before generating your NSMangedObject subclcasses).
8. Set up a convenience initializer for Playlist.
9. Set up a convenience initializer for Song.
10. One by one, work with the students to fix all of your functions that worked with NSUserDefaults to now work with CoreData. Be sure to do it in small enough segments that they can follow, and have them do each step independently after you show them how, and then do it again as a group.