/// ------------------------------------------------------------
/// ---------Dart Dart Frog - The Complete Crash Course---------
/// --------https://medium.com/@tomicriedel/cff6fc9f033b--------
/// ------------------------------------------------------------

/// Snap 1 - onRequest basic method
import 'dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response(
    body: 'Never gonna give you up!',
  );
}

/// Snap 2 - Use RequestContext
Response onRequest(RequestContext context) {
  // Access incoming request
  final request = context.request;

  return Response(
    body: 'Never gonna give you up!',
    statusCode: 204,
  );
}

/// Snap 3 - Use futures and return json
Future<Response> onRequest(RequestContext context) async {
  final result = await _myFuture();
  return Response.json(body: result);
}

/// Snap 4 - Use middleware
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (context) async {
    // Execute code before request is handled.
    print('This is before request is handled');

    // Now, we handle the request. The handler functions
    // Helps us "find" the correct onRequest method, that is now executed.
    // For example, it could call the function from Snap 2
    final response = await handler(context);

    // Execute code after request is handled.
    print('This is after request is handled');

    // Return a response. Usually the response given
    // by the handler. 
    return response;
  };
}

/// Snap 5 - Use build-in-middlware
Handler middleware(Handler handler) {
  return handler.use(requestLogger());
}