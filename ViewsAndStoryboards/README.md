ViewsAndStoryboards is a collection of challenges for students to complete on the first day to ensure that they understand the basics of UIKit elements, Interface Builder, View Hierarchies, etc..

**Look over the README in the root folder of this repository**

1. Screen  Name: Create a view that displays your name. Change the font and font color using Interface Builder. Create a subclass of UIViewController and change the background color of your label programmatically.

2. Lifecycle: Using the above subclass of UIViewController, prints each available lifecycle event to the console.

3. Identify the Controls: Open the Clock system app. Try to identify the different UI elements, specifically the UIControls. Compare with your neighbor.

4. Background Disco: Create a view controller scene that changes background colors on 3 different UIControlEvents on a UIButton. Segue to this scene from your existing Screen Name and Lifecycle scene.

5. Navigation:
	* On your disco view controller, create a horizontal stack view with three more buttons that push to 3 different detail views
	* Set various background colors to the detail views to differentiate between them
	* Embed the initial view controller into a UINavigationController
	* Use a 'show' segue to present the views

6.Documentation Review:
	* Find out what happens when you add more than 5 view controllers to a UITabBarController

7. Storyboard Signup View: 
	* Create a button on your disco view controller that will segue to a SignupViewController that has a text field for an e-mail address and a sign up button to submit the form.
	* Create a segue from the Sign Up button to a WelcomeViewController scene that will display 'Welcome (email)!'. You will use the prepareForSegue function to pass the e-mail address from the text field on the SignupViewController to the WelcomeViewController.
