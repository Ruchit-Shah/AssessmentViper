# AssessmentViper
Assessment with Viper structure
Task Summary:

The assignment requires you to develop a modular mobile application in Swift and UIKit following the VIPER architecture. The application should include two modules, Module A and Module B with only two screens (a listing screen and a details screen).
 
Task Description:
Develop a modular mobile application in Swift and UIKit following the VIPER architecture.
The application should consist of two modules:
Module A: This would contain only one screen (Listing Screen)
Module B: This would contain only one screen (Details Screen)

Task Submission:
The task should be submitted on GitHub or GitLab.

Designs:
Keep the UI very simple (Refer to the following designs).
UI should support the full name of the item without any truncation

Logic & Business Flows:
The user should land on the Listing screen, the screen should always fetch the data from the API and then cache the data in the local DB. In case of API failure, the screen should fetch the data from the DB if it exists, otherwise, an error should be displayed.
Use the following API:
http://universities.hipolabs.com/search?country=United%20Arab%20Emirates
Feel free to choose any kind of DB, But the preferred DB is Realm.
If the user taps on one of the items in the list, he should be redirected to a details screen, with the capability to refresh the listing screen
No second API call is required, the data should be passed from the first screen
The refresh button functionality is to trigger a refresh on the listing screen
The details screen should be dismissed, landing the user on the first screen
The listing screen should be reloaded and the API should be fired again 
Requirements & Tips:
Modular Architecture:
Implement a modular architecture for the application to promote code organization and separation of concerns.
Create only two simple screens in two different modules: The listing screen (Module A) and the details screen (Module B).
VIPER Architecture:
Organize your code following the VIPER architecture
Database:
Feel free to choose any kind of DB, But the preferred DB is Realm.
Networking:
Implement network requests using either URLSession or Alamofire to interact with the APIs.
Offline Support:
Ensure that the app works seamlessly when the API is failed. Utilizing the data cached in the local DB.
Avoid Reactive Programming:
Do not use reactive programming libraries such as RXSwift or Combine.
Avoid Async/Await:
Avoid using Swift's async/await concurrency model.
Swift and UIKit:
Develop the application using Swift as the programming language and UIKit for building the user interface.
Unit Testing (Not Mandatory, It’s a plus):
Implement unit tests for critical parts of the application, including network request handling, data retrieval, and data 
UI:
The UI is the least priority, so please don't focus too much on the UI and keep it as simple as possible.
Ensure that your code adheres to Swift naming conventions and follows best practices for code organization. Providing comments or documentation explaining the functionality and design decisions made during development is a plus.
