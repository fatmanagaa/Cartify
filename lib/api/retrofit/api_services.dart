import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/request/account/add_address_request_dto.dart';
import 'package:ecommerce_app/api/model/request/account/change_password_request_dto.dart';
import 'package:ecommerce_app/api/model/request/account/update_user_data_request_dto.dart';
import 'package:ecommerce_app/api/model/request/auth/login/login_request_dto.dart';
import 'package:ecommerce_app/api/model/request/auth/register/register_request_dto.dart';
import 'package:ecommerce_app/api/model/request/cart/add/add_cart_request_dto.dart';
import 'package:ecommerce_app/api/model/request/cart/put/count_request_dto.dart';
import 'package:ecommerce_app/api/model/request/wishlist/add_product_to_wishlist_request_dto.dart';
import 'package:ecommerce_app/api/model/response/account/addresses_response_dto.dart';
import 'package:ecommerce_app/api/model/response/auth/auth_response_dto.dart';
import 'package:ecommerce_app/api/model/response/cart/get/get_cart_response_dto.dart';
import 'package:ecommerce_app/api/model/response/product/product_response_dto.dart';
import 'package:ecommerce_app/api/model/response/product/single_product_response_dto.dart';
import 'package:ecommerce_app/api/model/response/wish_list/add_to_wishlist_response_dto.dart';
import 'package:ecommerce_app/api/model/response/wish_list/delete_from_wishlist_response_dto.dart';
import 'package:ecommerce_app/api/model/response/wish_list/get_wishlist_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../model/api_constants/api_endpoints.dart';
import '../model/response/cart/add/add_product_cart_response_dto.dart';
import '../model/response/category_brand/category_or_brand_dto_response.dart';
import '../model/response/sub_categories/sub_categories_response_dto.dart';

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
  @GET(ApiEndpoints.subCategoriesOnCategory)
  Future<SubCategoriesResponse> getSubCategories(
    @Path('categoryId') String categoryId,
  );

  @POST(ApiEndpoints.wishlist)
  Future<AddToWishlistResponseDto> addToWishlist(
    @Body() AddProductToWishlistRequestDto request,
    @Header('token') String token,
  );

  @DELETE(ApiEndpoints.removeFromWishlist)
  Future<DeleteFromWishlistResponseDto> deleteFromWishlist(
    @Path('productId') String productId,
    @Header('token') String token,
  );

  @GET(ApiEndpoints.wishlist)
  Future<GetWishlistDto> getWishlist(
    @Header('token') String token,
  );

  // ---------- Account ----------
  @PUT(ApiEndpoints.updateMe)
  Future<AuthResponseDto> updateUserData(
    @Body() UpdateUserDataRequestDto request,
    @Header('token') String token,
  );

  @PUT(ApiEndpoints.changeMyPassword)
  Future<AuthResponseDto> changePassword(
    @Body() ChangePasswordRequestDto request,
    @Header('token') String token,
  );

  // ---------- Addresses ----------
  @GET(ApiEndpoints.addresses)
  Future<AddressesResponseDto> getAddresses(
    @Header('token') String token,
  );

  @POST(ApiEndpoints.addresses)
  Future<AddressesResponseDto> addAddress(
    @Body() AddAddressRequestDto request,
    @Header('token') String token,
  );

  @DELETE(ApiEndpoints.removeAddress)
  Future<AddressesResponseDto> deleteAddress(
    @Path('addressId') String addressId,
    @Header('token') String token,
  );
}
