import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../core/cache/shared_prefs_utils.dart';
import '../../core/exceptions/app_exceptions.dart';

class DioInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SharedPrefsUtils.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

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
  final headers = <String, dynamic>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  if (token != null) {
    headers['token'] = token;
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://ecommerce.routemisr.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: headers,
    ),
  );

  dio.interceptors.addAll([
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final authHeader = options.headers['token'] ?? options.headers['Authorization'];
        if (authHeader != null) {
          // Token present
        }
        handler.next(options);
      },
    ),

    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),

    DioInterceptors(),
  ]);

  return dio;
}
