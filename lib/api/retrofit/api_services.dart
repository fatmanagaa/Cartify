import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/request/auth/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/request/auth/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/request/cart/add/add_cart_request_dto.dart';
import 'package:ecommerce_app/api/model/request/cart/put/count_request_dto.dart';
import 'package:ecommerce_app/api/model/response/auth/auth_response_dto.dart';
import 'package:ecommerce_app/api/model/response/cart/get/get_cart_response_dto.dart';
import 'package:ecommerce_app/api/model/response/product/product_response_dto.dart';
import 'package:ecommerce_app/api/model/response/product/single_product_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../model/api_constants/api_endpoints.dart';
import '../model/response/cart/add/add_product_cart_response_dto.dart';
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

  @GET(ApiEndpoints.productsEndpoint)
  Future<ProductResponseDto> getAllProducts();

  @GET('${ApiEndpoints.productsEndpoint}/{id}')
  Future<SingleProductResponseDto> getProductDetails(
    @Path('id') String productId,
  );

  @POST(ApiEndpoints.cartEndpoint)
  Future<AddProductCartResponseDto> addProductToCart(
    @Body() AddCartRequestDto addCartRequest,
    @Header('token') String token,
  );

  @GET(ApiEndpoints.cartEndpoint)
  Future<GetCartResponseDto> getItemsInCart(@Header('token') String token);

  @DELETE(ApiEndpoints.deleteCartApi)
  Future<GetCartResponseDto> deleteItemsInCart(
    @Path('productId') String productId,
    @Header('token') String token,
  );

  @PUT(ApiEndpoints.deleteCartApi)
  Future<GetCartResponseDto> updateCountInCart(
    @Path('productId') String productId,
    @Body() CountRequestDto countRequest,
    @Header('token') String token,
  );
}
