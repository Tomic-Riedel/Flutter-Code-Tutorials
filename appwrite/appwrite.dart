/// ------------------------------------------------------------
/// ---------Fluter Appwrite - The Complete Crash Course--------
/// --------https://medium.com/@tomicriedel/d4e8cf567e2f--------
/// ------------------------------------------------------------

/// Snap 1 - Init your SDK
import 'package:appwrite/appwrite.dart';

void main() {
  Client client = Client();

  client
          .setEndpoint('https://localhost/v1') // Your Appwrite Endpoint
          .setProject('5e8cf4f46b5e8') // Your project ID
          .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
      ;

  runApp(MyApp());
}

/// Snap 2 - Create a new user

// Create account variable
Account account = Account(client);

// Create account
Future user = account.create(
  userID:
      'unique()', // Appwrite will automaticall create a userId when specifying unique()
  email: 'my_email@mail.com',
  password: 'This is a strong password',
  name: 'My Name',
);

// We handle errors in appwrite like this:
result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
});

/// Snap 3 - Check if user is logged in
Future result = account.get();

result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
});

/// Snap 4 - Login user
Future result = account.createEmailSession(
    email: 'email@example.com',
    password: 'password',
  );

  result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
  });

/// Snap 5 - Logout user
Future result = account.deleteSession(
    sessionId: '[SESSION_ID]',
  );

result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
});

/// Snap 6 - Delete user
import 'package:dart_appwrite/dart_appwrite.dart';

void main() { // Init SDK
  Client client = Client();
  Users users = Users(client);

  client
    .setEndpoint('https://[HOSTNAME_OR_IP]/v1') // Your API Endpoint
    .setProject('5df5acd0d48c2') // Your project ID
    .setKey('919c2d18fb5d4...a2ae413da83346ad2') // Your secret API key
  ;

  Future result = users.delete(
    userId: '[USER_ID]',
  );

  result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
  });
}

/// Snap 7 - List User Documents

Databases databases = Databases(client, databaseId: '[DATABASE_ID]');

Future result = databases.listDocuments(
    collectionId: '[COLLECTION_ID]',
);

result
    .then((response) {
        print(response);
    }).catchError((error) {
      print(error.response);
  },
);

/// Snap 8 - Get Document
Future result = databases.getDocument(
    collectionId: '[COLLECTION_ID]',
    documentId: '[DOCUMENT_ID]',
  );

result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
});

/// Snap 9 - Create Document
Future result = databases.createDocument(
    collectionId: '[COLLECTION_ID]',
    documentId: '[DOCUMENT_ID]',
    data: {},
  );

  result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
});