import '../../../domain/entities/response/product/product.dart';

sealed class ProductDetailsStates {}

class ProductDetailsInitialState extends ProductDetailsStates {}

class ProductDetailsLoadingState extends ProductDetailsStates {}

class ProductDetailsErrorState extends ProductDetailsStates {
  final String errorMessage;
  ProductDetailsErrorState({required this.errorMessage});
}

class ProductDetailsSuccessState extends ProductDetailsStates {
  final Product? product;
  ProductDetailsSuccessState({required this.product});
}
