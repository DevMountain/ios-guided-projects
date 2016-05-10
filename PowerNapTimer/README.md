PowerNapTimer is designed to have students practice implementing timer logic and using NSNotifications.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PowerNapTimer

*Start this project from scratch*

1. Show students the final product first so they know what they are working toward.
1. Set up the view in storyboard. You will need to put a label and a button into a stack view. Make sure students understand how stack views work and understand the constraints you are using. Create a view controller file if necessary and create outlets for your label and button, and create an action for your button.
2. Plan out your project for a few minutes with the students. Show proper MVC architecture by creating a Timer class and a TimerController class. 
3. Fill in the properties and initializer(s) needed for the Timer class and help students understand why each is needed.
3. Create the properties and method signatures for your TimerController class and help students understand why each is needed.
4. Talk through and fill in each method necessary for the timer function to work *one at a time* (i.e. each function is its own segment) but don't implement the NSNotifications yet. Pay special attention to the logic tying the functions together.
6. Discuss NSNotifications. Implement them in the functions where they go. 
5. Switch to the view controller. Make your view controller an observer for your NSNotifications. Do any additional view setup you might need.
6. Fill in the method signatures and complete anything else on the view controller you might need for your timer to work (i.e. the view counts down).
  * At this point make sure every student's timer works as expected (You might change the time from 20 minutes to 15 seconds to verify that the view changes properly when time is up). 
