Settings is a project designed to help students practice working with intermediate table view concepts, creating protocols, and implementing MVC patterns

**Look over the README in the root folder of this repository**

# Suggested breakdown for Settings

Before starting, make sure everyone has the images they need.

1. Set up the view in storyboard (without creating the custom cell yet) and create your view controller file. Do not use a UITableViewController because we want to show how to make an external data source later.
2. Create your custom cell in storyboard, explaining your constraints along the way.
3. Explain that all UIViews, including UITableViewCells, are just classes. Just like we subclass UIViewController to make more specific view controllers, we can subclass UITableViewCells to make more specific cells. Create your custom class and make sure your prototype cell is of that class. Create your outlets and actions.
4. Set up your model object.
5. Set up your model controller with mock data.
6. Implement your table view data source functions but leave a comment where you should be updating the cell's subviews.
7. Create an updateWithCell function on your custom cell class, and call it from your table view data source function. Include in the updateWithCell function a change in cell background color based on the setting's isSet property (that way you can tell what the model is storing for isSet even after tapping the switch).
  * Make sure everyone can run their app and show the four mock settings in the tableview. Explain that although the switch is moving, the background color not changing means that we aren't actually changing the model object, which we need to do.
8. Begin to explain the delegate pattern and review how protocols work. It might be useful to update the model in the action and ask why that isn't appropriate (views shouldn't interact with models). A good analogy is an outfielder throwing the ball to home plate - it's possible but the ball will bounce and so it's more effective to throw to an infielder who will throw home.
9. Make your custom delegate and add a property to the cell of the delegate type, and call your delegate function from your action.
10. Make your view controller conform to the delegate protocol and implement the body of the delegate function by calling a method on the model controller that updates the model.
11. Create the method on your model controller that updates the Setting object if you haven't already.
  * Run and make sure everyone sees how the background color of the cell now changes because we have created a chain of calls that end in updating the model object. Make sure everyone's project is working.
