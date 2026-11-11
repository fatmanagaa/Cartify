import 'package:ecommerce_app/core/exceptions/app_exceptions.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/domain/usecases/add_to_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/usecases/delete_from_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/usecases/get_wishlist_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'wishlist_states.dart';

@lazySingleton
class WishlistViewModel extends Cubit<WishlistStates> {
  final GetWishlistUseCase _getWishlistUseCase;
  final AddToWishlistUseCase _addToWishlistUseCase;
  final DeleteFromWishlistUseCase _deleteFromWishlistUseCase;

  WishlistViewModel(
    this._getWishlistUseCase,
    this._addToWishlistUseCase,
    this._deleteFromWishlistUseCase,
  ) : super(WishlistInitialState());

  List<Product> wishlistProducts = [];
  Set<String> wishlistProductIds = {};

  Future<void> getWishlist() async {
    try {
      emit(WishlistLoadingState());
      var response = await _getWishlistUseCase.invoke();
      wishlistProducts = response.data ?? [];
      wishlistProductIds = wishlistProducts
          .map((p) => p.id)
          .whereType<String>()
          .toSet();
      emit(WishlistSuccessState(wishlistProducts: wishlistProducts));
    } on AppException catch (e) {
      emit(WishlistErrorState(errorMessage: e.message));
    } catch (e) {
      emit(WishlistErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addToWishlist(String productId) async {
    try {
      emit(AddToWishlistLoadingState());
      var response = await _addToWishlistUseCase.invoke(productId);
      wishlistProductIds.add(productId);
      emit(AddToWishlistSuccessState(
        message: response.message ?? 'Added to wishlist successfully',
        productIds: response.data,
      ));
      getWishlist();
    } on AppException catch (e) {
      emit(AddToWishlistErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AddToWishlistErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteFromWishlist(String productId) async {
    try {
      emit(DeleteFromWishlistLoadingState());
      var response = await _deleteFromWishlistUseCase.invoke(productId);
      wishlistProductIds.remove(productId);
      wishlistProducts.removeWhere((p) => p.id == productId);
      emit(DeleteFromWishlistSuccessState(
        message: response.message ?? 'Removed from wishlist successfully',
        productIds: response.data,
      ));
      emit(WishlistSuccessState(wishlistProducts: List.from(wishlistProducts)));
    } on AppException catch (e) {
      emit(DeleteFromWishlistErrorState(errorMessage: e.message));
    } catch (e) {
      emit(DeleteFromWishlistErrorState(errorMessage: e.toString()));
    }
  }

  bool isWishlisted(String? productId) {
    if (productId == null) return false;
    return wishlistProductIds.contains(productId);
  }
}
