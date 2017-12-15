StudentPUTAPI is a very simple multi-user student directory app. It uses a simple REST API, and demonstrates the use of PUT to create records.

**Look over the README in the root folder of this repository**

# Suggested breakdown for StudentPUTAPI

Instructor preparation (students need not do this):

1. Create a new project on Firebase
2. In the Database section, create an endpoint with a resonable name:

    ![New Database](.screenshots/NewDatabase.png)
    
3. Note the URL at the top of the database panel, e.g. https://names-e4301.firebaseio.com/. You will need this when writing the app.

4. On the rules tab, change read and write to true:

    ![Rules Tab](.screenshots/Rules.png)
    

*Start this project from scratch*

1. Set up the table view controller in the storyboard.
2. Create the `Student` model.
3. Add an extension to `Student` with functionality related to JSON.
4. Create the model controller, `StudentController`. Explain that we use PUT to create/add new data on an API. Tell the students after the app is working we can go back and discuss the difference between `PUT` and `POST`.
5. Create `StudentTableViewController` including methods to fetch students, add new ones, and display them.
6. Students should be able to run the app, and add their name to the list. Relaunching the app should show all students that have been submitted to the API.
7. After you feel like the students have a grasp of how things are working. Go back and talk about what the differences are if we use `POST` instead of `PUT`.