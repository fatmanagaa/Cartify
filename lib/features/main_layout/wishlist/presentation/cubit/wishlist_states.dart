import 'package:ecommerce_app/domain/entities/response/product/product.dart';

sealed class WishlistStates {}

class WishlistInitialState extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {
  final String errorMessage;

  WishlistErrorState({required this.errorMessage});
}

class WishlistSuccessState extends WishlistStates {
  final List<Product> wishlistProducts;

  WishlistSuccessState({required this.wishlistProducts});
}

class AddToWishlistLoadingState extends WishlistStates {}

class AddToWishlistSuccessState extends WishlistStates {
  final String message;
  final List<String?>? productIds;

  AddToWishlistSuccessState({required this.message, this.productIds});
}

class AddToWishlistErrorState extends WishlistStates {
  final String errorMessage;

  AddToWishlistErrorState({required this.errorMessage});
}

class DeleteFromWishlistLoadingState extends WishlistStates {}

class DeleteFromWishlistSuccessState extends WishlistStates {
  final String message;
  final List<String?>? productIds;

  DeleteFromWishlistSuccessState({required this.message, this.productIds});
}

class DeleteFromWishlistErrorState extends WishlistStates {
  final String errorMessage;

  DeleteFromWishlistErrorState({required this.errorMessage});
}

