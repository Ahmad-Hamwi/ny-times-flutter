## Running the project

#### Run the `build_runner`
`dart run build_runner build --delete-conflicting-outputs`

#### Test the app
Running unit tests by `flutter test` and integration tests `flutter test integration_test`

#### Running the app
ensure you have a device connected and run `flutter run lib/entrypoint/main.dart`

## Project structure

#### Presentation Layer
The layer that has most of the work since our app has the most complex functionalities in its UI, e.g. navigation, filtration, searching, multiple views, etc.

Contains Bloc state management, the built-in navigation solution from Flutter sdk, and our UI.

#### Domain Layer
The layer in which specifies the domain of the app, but in our app has almost no business logic, but our entities serve as our own data models.

Contains Entities, Interactors (Use Cases), Gateways (Repositories).

#### Data Layer
The layer in which has technical details in fetching and mapping the data.

Contains Retrofit & Dio, Repository implementations, and mappers.

#### DI solution
The DI solution used in the project is by using get-it service locator.

#### State management solution
The State management solution used in the project is Bloc state management.

## Testing

#### Unit tests
Found under the test folder, contains plain dart tests and UI widget tests.

#### Integration tests
Found under the integration_test folder, contains tests of the domain + data layer altogether.

## Notes

#### Default behavior when entering the home page
I'm fetching articles remotely from the NY times API, and the filters (sections) locally as documented in the API docs.

#### Saving secrets (api key)
I currently have the API key hard-coded, the best practices normally save those kind of keys locally on the developers machine and obfuscating the release builds, 
but for the sake of the assessment I won't be hiding the key from the version control.

#### Integration testing the domain + data layers
I normally unit test every every unit containing logic, but the domain and data layers had only routing/mapping logic, so I've written an integration which test both layers. No need for unit testing empty units.

#### Integration UI tests
If the UI component has no logic, I integrate test it with other components. For example: the ArticleGridItem and ArticleListItem are tested by widget testing their wrappers: ArticleListsToggler.

#### Design of the bloc and why are the states like that?
The states of the bloc are designed in a way that satisfy an initial full fetch (articles and sections; full page), and then other smaller fetches (filtered articles only). 

#### Separation of concerns
I have kept everything as simple as possible, and separated as much units with their single responsibility as possible.

#### Local searching
Since the NY times API does not provide a way to filter by string query parameter, I've implemented the search functionality locally.

#### Error handling & Empty handling $ Retry mechanism
The Error and empty handling are implemented using the `LayoutError` & `LayoutEmpty`, and `LayoutError` contains a retry button.  