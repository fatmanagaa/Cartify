import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/request/auth/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/request/auth/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/response/auth/auth_response_dto.dart';
import 'package:ecommerce_app/domain/entities/request/auth/register/register_request.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'model/api_endpoints.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginEndpoint)
  Future<AuthResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiEndpoints.registerEndpoint)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto request);
}
