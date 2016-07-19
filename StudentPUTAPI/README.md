BulletinBoard is a very simple multi-user bulletin board app. It uses CloudKit for both persistence and sync. It will help the students practice and understand CloudKit concepts including querying, saving, and subscriptions in a very simple app, without any local persistence.

**Look over the README in the root folder of this repository**

# Suggested breakdown for BulletinBoard

Instructor preparation (students need not do this):

1. Create a new project on Firebase
2. In the Database tab, create an endpoint with a resonable name:

    ![New Database](.screenshots/NewDatabase.png)


*Start this project from scratch*


2. Set up the Messages List View Controller in the storyboard.
3. Create the model struct, `Message`.
4. Add an extension to `Message` with functions and properties necessary for use with CloudKit. Explain that we need to be able to get a CloudKit record from a `Message`, as well as initialize a new Message instance with a `CKRecord`.
5. Create `CloudKitManager`. Add the functions needed for this app. Note that these functions will be the same as in Timeline, but we will only implement the small number of them actually needed for this app. (The subscription method is not needed until Day 2.) Explain that `CloudKitManager` is completely generic, not specific to BulletinBoard.
6. Create the model controller, `MessagesController`. Methods in `MessagesController` should call the appropriate `CloudKitManager` methods.
7. Implement `MessagesListViewController`
8. Students apps should work. They should be able to post a message, and upon killing and relaunching the app see it load again.
