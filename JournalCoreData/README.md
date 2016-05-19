JournalCoreData has students practice using an NSFetchedResultsController to display information stored in Core Data in a Table View.

**Look over the README in the root folder of this repository**

# Suggested breakdown for JournalCoreData

### Start this project from the project JournalCoreData in the branch projectStarts

1. Show students the final product first so they know what they are working toward. 
2. Send them the version they should start from, and note how there is an added property for happy or sad, and a segmented control on the detail view to set the property.
3. Explain what an NSFetchedResultsController is. Have them look in documentation and explain to each other what they think it does and how they think it works.
4. Since an NSFetchedResultsController manages objects and fetching for you, you can delete your ```fetchEntries()``` function and any references to it, and delete your ```entries``` array.
5. Instead of this, create a constant property on ```fetchedResultsController: NSFetchedResultsController```. You need to initialize this in the initializer by first creating an NSFetchRequest and giving it two sort descriptors, one for the ```happy``` property, and one for the ```timestamp``` property. You can then initialize the NSFetchedResultsController and perform the initial fetch.
6. Turn your attention to the view controller. Help students implement the Table View Data Source functions one at a time using the ```fetchedResultsController```.
7. Talk about the delegate pattern and the NSFetchedResultsControllerDelegate. Import CoreData and adopt the delegate protocol.
8. Implement the delegate functions one at a time, explaining the nuances of updating the table view one cell at a time instead of just reloading the table view.
9. Run the project and be sure everyone's works. As a parting challenge, have them delete the implementation of their ```func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?)``` function and do it over again as independently as possible.