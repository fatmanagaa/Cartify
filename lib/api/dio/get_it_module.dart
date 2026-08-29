import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/dio/dio_interceptors.dart';
import 'package:ecommerce_app/api/model/api_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api_services.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveTimeout: Duration(seconds: 5),
        sendTimeout: Duration(seconds: 5),
      );

  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        request: true,
      );

  @singleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  ApiServices get apiServices => ApiServices(
        provideDio(baseOptions, prettyDioLogger),
      );
}

//todo: apiServices => object dio
//todo: dio => BaseOptions , PrettyDioLogger , Interceptors
