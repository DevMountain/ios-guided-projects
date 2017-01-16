TableView teaches students how to set up a basic tableview using both dataSource and delegate methods, and how to transition to a detail screen passing information through `prepare(for: UIStoryboardSegue, sender: Any?)`.

**Look over the README in the root folder of this repository**

# Suggested breakdown for TableView

*Start this project from scratch*

1. Show students the final product so they know what they are working toward.
1. Make sure students are comfortable adding a view controller to storyboard. Show them how to bring out a TableViewController. Give your prototype cell an identifier and set its style to basic.
2. Embed your TableViewController in a NavigationController.
3. Bring out a ViewController and add a segue from the table view cell to the ViewController and give the segue an identifier.
4. Create a subclass for the table view controller, and set the class of the view controller in the storyboard.
5. Go to your `WeekTableViewController` and add a `daysOfWeek` property that is an array of Strings representing the days of the week.
6. Talk about the TableViewDataSource methods, show them how they can learn about the methods with documentation, and show them one by one how to implement them. Have them do it independently. Then regroup and do it all together.
7. Talk about how you also can use different delegate methods. Show them how to use `tableView(_:heightForRowAt:)` and then have them do it independently and then regroup and do it all together.
8. Discuss `prepare(for: UIStoryboardSegue, sender: Any?)`, have them look at documentation, show them the implementation for it in this case, then have them do it independently and then do it together. 
9. Everyone's project should be done and working.
