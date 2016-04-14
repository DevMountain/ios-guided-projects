PowerNapTimer is designed to have students practice implementing timer logic, NSNotifications, UIAlertController, and UILocalNotifications

# General Mini-Project Guidelines
* Be aware of the lesson objectives and **_prepare ahead of time_**
* The project should be broken into small segments (typically something you can do in less than two minutes on your own, i.e. set up view hierarchy in storyboards, create files for models and controllers, implement model, write function headers for model controllers, etc.). In later units there may be initial setup that students can do more independently.
* Each segment should be completed following the "I do, you do, we do" pattern:
  1. Instructor completes the small segment while students *observe only*
  2. Instructor removes completed portion from the screen and students complete the small segment with the help of documentation and mentor guidance *if necessary*
  3. Instructor completes the small segment for a second time with students watching carefully and ensuring that they completed the task correctly
* Do not be afraid to make slight, temporary deviations from the lesson objectives if there are *fundamental* knowledge gaps that need to be filled. However, be aware of time and whether or not all students need this deviation. If can be better resolved with that individual after the lesson, then do it after.
* Most importantly, **know your stuff, know your students, and care about their success**. Do that and you'll be great.

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
