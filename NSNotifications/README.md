NSNotifications is designed to help students transfer information between classes using NSNotifications.

**Look over the README in the root folder of this repository**

# Suggested breakdown for NSNotifications

This project can be relatively short, so please make sure students understand every line of code.

1. Show students the final product first so they know what they are working toward.
1. Set up the view in storyboard, explaining your constraints.
2. Create your view controller subclasses, create your outlets and actions.
3. Create an appearance controller with a static function that sets the universal appearance of the app. Call it somewhere and run the app to show students what it does.
3. Go over NSNotifications and what they do. Send an NSNotification from your buttonTapped action in the first view controller.
4. Add the second view controller as an observe to the NSNotification. In your chosen selector for the notification, change the label text to "Got it!" so that students can see that the notification was sent and received.
5. Discuss the user info aspect of NSNotifications and how you can send information as a dictionary. Add your text field text to a dictionary and put it into your notification's user info property.
6. On the receiving view controller, change your function that the selector points to so that it takes the notification as a parameter.
7. Unwrap the user info property and set the label's text to the text passed through the notification. 
    * Make sure everyone understands the conditional binding used to unwrap and cast the user info object as a dictionary.