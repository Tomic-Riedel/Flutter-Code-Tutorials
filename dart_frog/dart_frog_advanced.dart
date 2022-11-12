/// ------------------------------------------------------------
/// ------------Dart Frog - The Advaced Crash Course------------
/// --------https://medium.com/@tomicriedel/4278f1bbfc58--------
/// ------------------------------------------------------------

/// Snap 1 - Create inline provider
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  
  // Inject 'Welcome to Dart Frog!' with a provider of type String
  return handler.use(provider<String>((context) => 'Welcome to Dart Frog!'));
}

/// Snap 2 - Create extracted provider
Middleware greetingProvider() {
  return provider<String>((context) => 'Hello World');
}

/// Snap 3 - Use the extracted provider
Handler middleware(Handler handler) {
  return handler.use(greetingProvider());
}

/// Snap 4 - Use asynchronous values
Middleware asyncGreetingProvider() {
  return provider<Future<String>>((context) async => 'Hello World');
}

/// Snap 5 - Access provided values
// "Normal" values
Response onRequest(RequestContext context) {
  final greeting = context.read<String>();
  return Response(body: greeting);
}

// Asynchronous values

// Make sure to add async keyword
Future<Response> onRequest(RequestContext context) async {

  // Use await keyword and Future<T>  
  final value = await context.read<Future<String>>();
  return Response(body: value);
}

/// Snap 6 - Unit Testing - use this in your testing file

// Import all necessary packages
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

// Maybe you are not familiar with this one:
// It is used to create a mock for our testing
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;

// We create a Mock that gives us a RequestContext that we can use
class _MockRequestContext extends Mock implements RequestContext {}

void main() {

  // Group is used to group up multiple tests
  // If you are not familiar with this, check out 
  // this article again: https://tomicriedel.medium.com/490a577fe077
  group('GET /', () {
    test('responds with a 200 and greeting.', () async {
      const greeting = 'Hello World!';

      // Create our context out of _MockRequestContext
      final context = _MockRequestContext();

      // Call onRequest with the mocked RequestContext
      when(() => context.read<String>()).thenReturn(greeting);
      final response = route.onRequest(context);

      // Expect a 200 response code with the response 'Hello World!'
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.body(), completion(equals(greeting)));
    });
  });
}

/// Snap 7 - Use custom entry point
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  // 1. Execute any custom code prior to starting the server...

  // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  return serve(handler, ip, port);
}

/// Snap 8 - Add custom static file directory
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  // 1. Execute any custom code prior to starting the server...
  // In this example it is our custom file path
  const customStaticFilePath = 'api/static';
  final cascade = Cascade()
      .add(createStaticFileHandler(path: customStaticFilePath))
      .add(handler);
  // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  return serve(handler, ip, port);
}