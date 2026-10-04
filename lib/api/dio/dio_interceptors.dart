import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../core/exceptions/app_exceptions.dart';

class DioInterceptors extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;

    final dynamic responseData = err.response?.data;
    String message = 'Something went wrong';

    if (responseData is Map) {
      message =
          responseData['errors']?['msg'] ?? responseData['message'] ?? message;
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        exception =
            NetworkException(message: 'Please check your internet connection');
        break;

      case DioExceptionType.badResponse:
        exception = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
        break;

      case DioExceptionType.cancel:
        exception = UnexpectedException(message: 'Request was cancelled');
        break;

      default:
        exception = UnexpectedException(message: message);
    }

    handler.next(DioException(
      requestOptions: err.requestOptions,
      error: exception,
      response: err.response,
      type: err.type,
    ));
  }
}

Dio getDioClient({String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.yourdomain.com', // Replace with your base URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    ),
  );

  dio.interceptors.addAll([
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final authHeader = options.headers['Authorization'];
        if (authHeader != null) {
          print('🔑 [AUTH TOKEN]: $authHeader');
        } else {
          print('🔑 [AUTH TOKEN]: No token found in request headers');
        }
        handler.next(options);
      },
    ),

    PrettyDioLogger(
      requestHeader: true,  // Prints request headers including Authorization
      requestBody: true,    // Prints request payload
      responseBody: true,   // Prints response payload
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),

    DioInterceptors(),
  ]);

  return dio;
}