# CollectionViews

CollectionViews is a project designed to introduce students to basic `UICollectionView`s. It will display the 50 state flags in a collection view. Assuming this guided project is done towards the end of the first six units, you should be able to complete the project fairly fast, as students should be very familiar with `UITableView`s already.

## Suggested breakdown:
1. Give students the project start Xcode project, as it contains the flag images in the assets folder, and a `StateHelper.swift` file containing the abbreviations and names of each state.

* Set up the collection view in the Storyboard. The cell should contain an image view to display the flag, and a label below it to show the state's name.

* Explain that setting up the collection view cell is essentially equivalent to setting up a custom `UITableViewCell`.

* Set up your model object class called `State`. It should contain a name constant and an abbreviation constant, and a memberwise intializer. The abbreviation is so that you can create a new `UIImage` from the state's abbreviation as it will match the flag image in the assets folder.
* Create a `StateController.swift` file and write the following:
* A singleton instance of the State Controller.
* An array of `State` objects that will be your collection view's data source.
* A function called `createAllStates()` explain that the function will be where we take the information from the `StateHelper.swift` and the assets folder to initialize all 50 instances of the `State` class to be able to show them on the collection view.
* In the initializer of the `StateController` call the `createAllStates` function.

* Create a file for your collection view cell
* Make the outlets from the image view and label in the storyboard. 
* Create a variable to hold a state that will be assigned in the `cellForItemAt:` function in the collection view controller later. In the `didSet`, it should call the `updateViews()` function below.
* Create an `updateViews()` function that sets the text of the label to be the cell's state variable's state name. Set the image view's image to a `UIImage` created using the `(imageNamed: ...)` initializer with the state's abbreviation.

* Create a `StatesCollectionViewController` subclass of `UICollectionViewController`, and fill it out its `UICollectionViewDataSource` methods. Though it should be fairly clear, make sure they realize that the data source functions for collection views and table views are nearly identical.
* In the `cellForItemAt`, set the cell's state to the given state for the index path of the cell.
* At this point, the project should be done. Also be sure to show the students that you can click on the "Collection View Flow Layout" in the storyboard and easily change the scroll direction from vertical to horizontal and vice-versa in the Attributes Inspector.
