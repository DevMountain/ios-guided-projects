Settings is a project designed to help students practice working with intermediate table view concepts, creating protocols, and implementing MVC patterns

# General Mini-Project Guidelines

* Be aware of the lesson objectives and **_prepare ahead of time_**
* The project should be broken into small segments (typically something you can do in less than two minutes on your own, i.e. set up view hierarchy in storyboards, create files for models and controllers, implement model, write function headers for model controllers, etc.). In later units there may be initial setup that students can do more independently.
* Each segment should be completed following the "I do, you do, we do" pattern:
  1. Instructor completes the small segment while students *observe only*
  2. Instructor removes completed portion from the screen and students complete the small segment with the help of documentation and mentor guidance *if necessary*
  3. Instructor completes the small segment for a second time with students watching carefully and ensuring that they completed the task correctly
* Do not be afraid to make slight, temporary deviations from the lesson objectives if there are *fundamental* knowledge gaps that need to be filled. However, be aware of time and whether or not all students need this deviation. If can be better resolved with that individual after the lesson, then do it after.
* Most importantly, **know your stuff, know your students, and care about their success**. Do that and you'll be great.

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
