import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/mapper/wish_list/add_to_wishlist_response_mapper.dart';
import 'package:ecommerce_app/api/mapper/wish_list/delete_from_wishlist_response_mapper.dart';
import 'package:ecommerce_app/api/mapper/wish_list/get_wishlist_response_mapper.dart';
import 'package:ecommerce_app/api/model/request/wishlist/add_product_to_wishlist_request_dto.dart';
import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/core/cache/shared_prefs_utils.dart';
import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/data/data_source/remote/wishlist/wishlist_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/add_to_wishlist_response.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/delete_from_wishlist_response.dart';
import 'package:ecommerce_app/domain/entities/response/wish_list/get_wishlist_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImplementation implements WishlistRemoteDataSource {
  final ApiServices apiServices;

  WishlistRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<AddToWishlistResponse> addToWishlist(String productId) async {
    try {
      var token = SharedPrefsUtils.getData(key: 'token');
      AddProductToWishlistRequestDto request = AddProductToWishlistRequestDto(
        productId: productId,
      );
      var response = await apiServices.addToWishlist(
        request,
        token.toString(),
      );
      return response.toAddToWishlistResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<DeleteFromWishlistResponse> deleteFromWishlist(String productId) async {
    try {
      var token = SharedPrefsUtils.getData(key: 'token');
      var response = await apiServices.deleteFromWishlist(
        productId,
        token.toString(),
      );
      return response.toDeleteFromWishlistResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetWishlistResponse> getWishlist() async {
    try {
      var token = SharedPrefsUtils.getData(key: 'token');
      var response = await apiServices.getWishlist(token.toString());
      return response.toGetWishlistResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}

