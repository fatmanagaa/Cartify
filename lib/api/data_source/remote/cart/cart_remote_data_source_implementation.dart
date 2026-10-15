import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefs_utils.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../data/data_source/remote/cart/cart_remote_data_source.dart';
import '../../../../domain/entities/response/cart/add/add_product_cart_response.dart';
import '../../../mapper/cart/add/add_cart_response_mapper.dart';
import '../../../mapper/cart/get/get_cart_response_mapper.dart';
import '../../../model/request/cart/add/add_cart_request_dto.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImplementation implements CartRemoteDataSource {
  final ApiServices apiServices;

  CartRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<AddProductCartResponse> addProductToCart(String productId) async {
    try {
      var token = SharedPrefsUtils.getData(key: 'token');
      AddCartRequestDto addCartRequest = AddCartRequestDto(
        productId: productId,
      );
      var addToCartResponse = await apiServices.addProductToCart(
        addCartRequest,
        token.toString(),
      );
      //todo: AddProductCartResponseDto => AddProductCartResponse
      return addToCartResponse.toAddProductCartResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    try {
      var token = SharedPrefsUtils.getData(key: 'token');
      var getCartResponse = apiServices.getItemsInCart(token.toString());
      return getCartResponse.then((response) => response.toGetCartResponse());
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }

  }
}