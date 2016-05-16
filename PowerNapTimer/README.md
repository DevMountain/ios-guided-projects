PowerNapTimer is designed to have students practice implementing timer logic.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PowerNapTimer

*Start this project from scratch*

1. Show students the final product first so they know what they are working toward. At the end the Timer should work but not update the UI.
1. Set up the view in storyboard. You will need to put a label and a button into a stack view. Make sure students understand how stack views work and understand the constraints you are using. Create a view controller file if necessary and create outlets for your label and button, and create an action for your button.
2. Plan out your project for a few minutes with the students. Show proper MVC architecture by creating a Timer class and a TimerController class. 
3. Fill in the properties and initializer(s) needed for the Timer class and help students understand why each is needed.
3. Create the properties and method signatures for your TimerController class and help students understand why each is needed.
4. Talk through and fill in each method necessary for the timer function to work *one at a time* (i.e. each function is its own segment). In secondTick be sure to print out the time remaining. Pay special attention to the logic tying the functions together.
6. Switch to the view controller. Fill in the method signatures and complete anything else on the view controller you might need for your timer to work (i.e. the view counts down) besides setting a delegate.
  * At this point make sure every student's timer works as expected (i.e. prints the time to the console but doesn't update the UI.) 
