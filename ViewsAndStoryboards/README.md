ViewsAndStoryboards is a collection of challenges for students to complete on the first day to ensure that they understand the basics of UIKit elements, Interface Builder, View Hierarchies, etc..

**Look over the README in the root folder of this repository**

1. Screen  Name: Create a view that displays your name. Change the font and font color using Interface Builder and change the background color programmatically.

2. Lifecycle: Create a subclass of UIViewController that prints each available lifecycle event to the console.

3. Identify the Controls: Open the Clock system app. Try to identify the different UI elements, specifically the UIControls. Compare with your neighbor.

4. Background Disco: Create a view controller scene that changes background colors on 3 different UIControlEvents on a UIButton.

5. Navigation:
	* Create a ViewController with buttons that push to 3 different detail views
	* Set various background colors to the detail views to differentiate between them
	* Embed the initial view controller into a UINavigationController
	* Use a 'show' segue to present the views
	* Create IBActions on the detail views to pop the view

6.Documentation Review:
	* Find out what happens when you add more than 5 view controllers to a UITabBarController

7. Storyboard Signup View: 
	* Create a project with a SignupViewController that has a text field for an e-mail address and a sign up button to submit the form.
	* Create a segue from the Sign Up button to a WelcomeViewController scene that will display 'Welcome (email)!'.
	* Use the prepareForSegue function to pass the e-mail address from the text field on the SignupViewController to the WelcomeViewController.

8. Overcast Stack Views: Using Auto Layout and Stack Views, build a close approximation to the player view from the popular podcast client Overcast.

9. Size Classed Selfie:
	* Create a Single View Application
	* Place a UIImageView on the initial scene using Interface Builder
	* Set the Image View's Image to a photo of yourself (or whatever you'd like)
	* Use Auto Layout or a Stack View to make sure that your UIImageView fills the view of the screen, no matter which size class
	* Verify in Interface Builder by selecting different size classes, or by running differently sized Simulator builds
