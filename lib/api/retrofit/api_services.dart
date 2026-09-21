import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/request/auth/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/request/auth/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/response/auth/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../model/api_constants/api_endpoints.dart';
import '../model/response/category_brand/category_or_brand_dto_response.dart';
part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginEndpoint)
  Future<AuthResponseDto> login(@Body() LoginRequestDto request);

  @POST(ApiEndpoints.registerEndpoint)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto request);

  @GET(ApiEndpoints.categoriesEndpoint)
  Future<CategoryOrBrandDtoResponse> getCategories();

  @GET(ApiEndpoints.brandsEndpoint)
  Future<CategoryOrBrandDtoResponse> getBrands();



}
