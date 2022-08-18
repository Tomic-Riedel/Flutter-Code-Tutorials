/// ------------------------------------------------------------
/// --------------------Flutter Dio Explained-------------------
/// --------https://medium.com/@tomicriedel/f3fbd1fc3bca--------
/// ------------------------------------------------------------

/// Snap 1 - Create dio variable
import 'package:dio/dio.dart';

var dio = Dio();

/// Snap 2 - Create dio variable with custom options

// Set configs based on default configs
dio.options.baseUrl = 'https://ww.nevergonnagiveyouup.com/api';
dio.options.connectTimeout = 5000; // 5 seconds
dio.options.receiveTimeout = 3000; // 3 seconds

// Create new dio with BaseOpptions Instance
var options = BaseOptions(
    baseUrl: 'https://ww.nevergonnagiveyouup.com/api',
    connectTimeout: 5000, // 5 seconds
    receiveTimeout: 3000, // 3 seconds
);

var dio = Dio(options);

/// Snap 3 - Request Options
{
  /// Http method.
  String method;

  /// Request base url, it can contain sub path, like: 'https://www.google.com/api/'.
  String baseUrl;

  /// Http request headers.
  Map<String, dynamic> headers;

   /// Timeout in milliseconds for opening  url.
  int connectTimeout;

   ///  Whenever more than [receiveTimeout] (in milliseconds) passes between two events from response stream,
  ///  [Dio] will throw the [DioError] with [DioErrorType.RECEIVE_TIMEOUT].
  ///  Note: This is not the receiving time limitation.
  int receiveTimeout;

  /// Request data, can be any type.
  T data;

  /// If the `path` starts with 'http(s)', the `baseURL` will be ignored, otherwise,
  /// it will be combined and then resolved with the baseUrl.
  String path='';

  /// The request Content-Type. The default value is 'application/json; charset=utf-8'.
  /// If you want to encode request body with 'application/x-www-form-urlencoded',
  /// you can set [Headers.formUrlEncodedContentType], and [Dio]
  /// will automatically encode the request body.
  String contentType;

  /// [responseType] indicates the type of data that the server will respond with
  /// options which defined in [ResponseType] are `JSON`, `STREAM`, `PLAIN`.
  ///
  /// The default value is `JSON`, dio will parse response string to json object automatically
  /// when the content-type of response is 'application/json'.
  ///
  /// If you want to receive response data with binary bytes, for example,
  /// downloading a image, use `STREAM`.
  ///
  /// If you want to receive the response data with String, use `PLAIN`.
  ResponseType responseType;

  /// `validateStatus` defines whether the request is successful for a given
  /// HTTP response status code. If `validateStatus` returns `true` ,
  /// the request will be perceived as successful; otherwise, considered as failed.
  ValidateStatus validateStatus;

  /// Custom field that you can retrieve it later in [Interceptor]、[Transformer] and the   [Response] object.
  Map<String, dynamic> extra;
  
  /// Common query parameters
  Map<String, dynamic /*String|Iterable<String>*/ > queryParameters;  
  
   /// [collectionFormat] indicates the format of collection data in request
  /// options which defined in [CollectionFormat] are `csv`, `ssv`, `tsv`, `pipes`, `multi`,`multiCompatible`.
  /// The default value is `multiCompatible`
  late CollectionFormat collectionFormat;

}

/// Snap 4 - Response Scheme
{
  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;
  /// Response headers.
  Headers headers;
  /// The corresponding request info.
  Options request;
  /// Http status code.
  int? statusCode;
  String? statusMessage;
  /// Whether redirect 
  bool? isRedirect;  
  /// redirect info    
  List<RedirectInfo> redirects ;
  /// Returns the final real request uri (maybe redirect). 
  Uri realUri;    
  /// Custom field that you can retrieve it later in `then`.
  Map<String, dynamic> extra;
}

Response response = await dio.get('https://www.google.com');
print(response.data);
print(response.headers);
print(response.requestOptions);
print(response.statusCode);

///Snap 5 - Interceptors
dio.interceptors.add(InterceptorsWrapper(
    onRequest:(options, handler){
     print('Before request was send'); // Do something before request is sent
     return handler.next(options); //continue
     // If you want to resolve the request with some custom data，
     // you can resolve a `Response` object eg: `handler.resolve(response)`.
     // If you want to reject the request with a error message,
     // you can reject a `DioError` object eg: `handler.reject(dioError)`
    },
    onResponse:(response,handler) {
     print('Response was received'); // Do something with response data
     return handler.next(response); // continue
     // If you want to reject the request with a error message,
     // you can reject a `DioError` object eg: `handler.reject(dioError)` 
    },
    onError: (DioError e, handler) {
     print('Error occured'); // Do something with response error
     return  handler.next(e);//continue
     // If you want to resolve the request with some custom data，
     // you can resolve a `Response` object eg: `handler.resolve(response)`.  
    }
));

/// Snap 6 - Handling errors
try {
  //404
  await dio.get('https://wendux.github.io/xsddddd');
} on DioError catch (e) {
  // The request was made and the server responded with a status code
  // that falls out of the range of 2xx and is also not 304.
  if (e.response != null) {
    print(e.response.data)
    print(e.response.headers)
    print(e.response.requestOptions)
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    print(e.requestOptions)
    print(e.message)
  }
}

// DioError scheme
{
  /// Response info, it may be `null` if the request can't reach to
  /// the http server, for example, occurring a dns error, network is not available.
  Response? response;
  /// Request info.
  RequestOptions? request;
  /// Error descriptions.
  String message;

  DioErrorType type;
  /// The original error/exception object; It's usually not null when `type`
  /// is DioErrorType.DEFAULT
  dynamic? error;
}

// DioErrorType
enum DioErrorType {
  /// It occurs when url is opened timeout.
  connectTimeout,

  /// It occurs when url is sent timeout.
  sendTimeout,

  ///It occurs when receiving timeout.
  receiveTimeout,

  /// When the server response, but with a incorrect status, such as 404, 503...
  response,

  /// When the request is cancelled, dio will throw a error with this type.
  cancel,

  /// Default error type, Some other Error. In this case, you can
  /// use the DioError.error if it is not null.
  other,
}