PowerNapTimer is designed to have students practice implementing timer logic, NSNotifications, UIAlertController, and UILocalNotifications

**Look over the README in the root folder of this repository**

# Suggested breakdown for PowerNapTimer

1. Set up the view in storyboard. You will need to put a label and a button into a stack view. Make sure students understand how stack views work and understand the constraints you are using. Create a view controller file if necessary and create outlets for your label and button, and create an action for your button.
2. Show proper MVC architecture by creating a Timer class and a TimerController class. Fill in the properties and initializer(s) needed for the Timer class and help students understand why each is needed.
3. Create the properties and method signatures for your TimerController class and help students understand why each is needed.
4. Talk through and fill in each method necessary for the timer function to work (leave out the local notifications and alerts) *one at a time* (i.e. each function is its own segment). Pay special attention to the logic tying the functions together and the NSNotifications that will let your view controller know what to display.
5. Switch to the view controller. Add your view controller as an observer to your NSNotifications, create method signatures that you will need to use as selectors, and do any additional view setup you might need.
6. Fill in the method signatures and complete anything else on the view controller you might need for your timer to work (i.e. the view counts down).
  * At this point make sure every student's timer works as expected
7. All together look at UIAlertController documentation while teaching about Alert Controllers. Create and present a UIAlertController when the timer is complete. Please take a few minutes to show aspects of UIAlertControllers that you might not need in this app, such as text fields, action handlers, etc..
  * At this point make sure every student's timer is presenting an alert upon completion (You might change the time from 20 minutes to 15 seconds to verify)
8. All together look at UILocalNotification documentation while teaching about local notifications. Register your local notification user settings.
9. Create a local notification when the timer starts that will fire when time is up. Please take a few minutes to talk about aspects of UILocalNotifications that you might not need in this app, such as actions..
  * At this point make sure every student's local notification is firing upon completion (You might change the time from 20 minutes to 15 seconds to verify)
10. Cancel the local notification if the timer is canceled before it finishes
  * At this point verify that everyone's timer works and check for any last questions before breaking 
