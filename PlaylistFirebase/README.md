PlaylistFirebase gives students the opportunity to practice using Firebase, a third party framework, to both post data to a server and observe changes to that data, and helps them develop an understanding of database structure.

**Look over the README in the root folder of this repository**

# Suggested breakdown for PlaylistFirebase

*Start this project from the version on the branch projectStarts*

1. Take a few minutes to show the current version of the app and to navigate through the existing code. Note that the starting version has added a login/signup screen in storyboards and has a commented out `FirebaseController`, but still uses NSUserDefaults for persistence.
2. Take no more than 25 minutes to have the students work in pairs to explain every line of code in the `FirebaseController`. Do this in chunks, i.e. give them a couple of minutes to explain to eachother what the line `static let base = Firebase(url: )` line does, then regroup and be sure everyone is on the same page. Then give them 5 minutes to explain the `protocol FirebaseType`, etc.
3. Take a few minutes to discuss as a group how the data will be structured in Firebase. In this specific project, we have chosen to nest playlists and songs underneath each user since each playlist corresponds to a user.
4. Make your `Song` object conform to `FirebaseType`. Then have the students try to do this for the `Playlist` and `Song` model objects. Then come back and do it again as a group.
5. Create your `User` object. Be sure that it conforms to `FirebaseType`. Have the students make it, then come back and do it again as a group.
6. Create your `UserController` and write the method signatures you will need. Have the students do it and then regroup and do it together.
7. Fill in the methods on your `UserController` one by one, having the students do it each time and then regrouping to do it together.
8. Modify your `LoginSignupViewController` to call the necessary `UserController` methods so that you can login and signup. Have everyone do this, and be sure that users are being created in Firebase. Show students the dashboard so they can see this happening.
9. Go through and one function at a time modify your `PlaylistController` so that it no longer uses NSUserDefaults, but instead adds playlists and songs to Firebase, and observes the data in Firebase. Continue to follow the "I do, you do, we do" method.
10. Have students add playlists and songs and show how they show up in the Firebase dashboard even though they do not show up on the tableview. Explain that we need to tell the view controller either with a notification or a delegate that the data has updated so that it can update its tableview. Do this, have them do it, then regroup and do it all together. Everyone should now have a finished product.