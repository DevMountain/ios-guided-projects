Survey lets students practice designing an API and network calls through NSURLSession

**Look over the README in the root folder of this repository, and follow those guidelines**

# Suggested breakdown for Survey

1. Show students the final product so that they will know what they are working toward.
2. Make sure that the students have signed up for Firebase. Have the students go over the documentation for how to use Firebase as a RESTful API (https://firebase.google.com/docs/reference/rest/database/). Point out that we will be using Get and Put to make our API. Also show the query parameters that can be used (limit, offset)
3. Go to the new Firebase console and create a new project. On the left, select database to see your data and make an endpoint called 'api', add a 'fakeData' key with the value 'true' to save the endpoint in the database. Click on the 'api' endpoint, and it will then display the link you will use for your project. 
4. In order to put or get (read/write), you need to change the rules in the Rules tab to 'auth == null'
5. Setup your views in storyboard, explaining your constraints.
6. Create your view controller subclasses, connect your outlets and actions. 
7. Bring in your NetworkController.
8. Create your model class, including your failable initializer.  To create the endpoint, we have to have the 'baseURL' from our modelController, so make a modelController with just the 'baseURL' inside. Explain that because we are posting multiple different things to the API, we want the endpoint/key for jsonValue to be a unique identifier. Explain the difference between 'URLByAppendingPathExtension' and 'URLByAppendingPathComponent'.
9. Return to the modelController class and implement the 'putSurveyIntoAPI' method. Explain why we don't need to use a singleton in this controller. 
10. Before writing the 'getResponses' method, focus on your 'IBAction' in your 'SurveyViewController' so that students can see their data posting. Run the app and let the students post to their API, and help with any errors that might have occurred.
11. Back in the 'SurveyController' implement the 'getResponses' method. 
12. Configure the 'ResponsesTableViewController' to display the responses of the survey. 
13. Commit and Push to GitHub.




