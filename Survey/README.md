Survey lets students design an API and make network calls through URLSession

**Look over the README in the root folder of this repository, and follow those guidelines**

# Suggested breakdown for Survey

1. Show students the final product so that they will know what they are working toward.
2. Make sure that the students have signed up for Firebase. Have the students go over the documentation for how to use Firebase as a RESTful API (https://firebase.google.com/docs/reference/rest/database/). Point out that we will be using GET and PUT to make our API. Also show the query parameters that can be used (limit, offset)
3. Go to the new Firebase console and create a new project. On the left, select database to see your data and make an endpoint called 'api', add a 'fakeData' key with the value 'true' to save the endpoint in the database. Click on the 'api' endpoint, and it will then display the link you will use for your project. 
4. In order to PUT or GET (read/write), you need to change the rules in the Rules tab to 'auth == null'
5. Setup your views in storyboard explaining your constraints.
6. Create your view controller subclasses, connect your outlets and actions. 
7. Bring in your `NetworkController`.
8. Create your model class, including a failable initializer.
9. Create a model controller and set up your base URL and getter endpoint at the top of the file. This might be a time to go over `appendingPathExtension` vs `appendingPathComponent`
9. Implement the 'putSurveyIntoAPI' method and create an endpoint for where we want to put our data. Explain that because we are posting multiple different things to the API we want the endpoint to be a unique identifier. Again, use `appendingPathExtension` and `appendingPathComponent` to create the endpoint. Also explain why we don't need to use a singleton in this controller. 
10. Before writing the `fetchResponses` method, focus on the `IBAction` in `SurveyViewController` so that students can see their data posting. Run the app and let the students post to their API and help with any errors that might have occurred.
11. Back in `SurveyController` implement the `fetchResponses` method. 
12. Configure the `ResponsesTableViewController` to display the responses of the survey. 
13. Commit and Push to GitHub.





