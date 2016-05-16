PowerNapTimerWithAlerts is designed to have students practice implementing timer logic, the delegate pattern, UIAlertController, and UILocalNotifications.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PowerNapTimerWithAlerts

*Start this project from PowerNapTimer, not from scratch*

1. Show the final product 3 separate times with 12 seconds on the clock so they can see the UIAlertController, the UILocalNotification, and then how the countdown persists across launches.
1. Take some time to walk through the timer logic again and make sure everyone has a decent handle on it. There is little enough code on the `Timer` class that you may want to have everyone explain to the person next to them how each line works.
2. Discuss that while you know the timer is working from the printout in the console, the UI needs to be updated. Perfect place to put a delegate. Work with them to create the delegate and get the UI updating as needed.
7. All together look at UIAlertController documentation while teaching about Alert Controllers. Create and present a UIAlertController when the timer is complete. Please take a few minutes to show aspects of UIAlertControllers that you might not need in this app, such as text fields and action handlers (they'll need both in the challenge).
  * At this point make sure every student's timer is presenting an alert upon completion (You might change the time from 20 minutes to 15 seconds to verify)
8. All together look at UILocalNotification documentation while teaching about local notifications. Register your local notification user settings.
9. Create a local notification when the timer starts that will fire when time is up. Please take a few minutes to talk about aspects of UILocalNotifications that you might not need in this app, such as actions.
  * At this point make sure every student's local notification is firing upon completion (You might change the time from 20 minutes to 15 seconds to verify)
10. Cancel the local notification if the timer is canceled before it finishes
11. Ask about what happens if the user closes the app but still expects the timer to continue. Create a function on the view controller called `resetTimer` that will get all of the app's scheduled local notifications in order to find the timer notification, get its fire date, and use that to start the timer again. Call this function from `viewDidLoad`. Check to make sure it works.
