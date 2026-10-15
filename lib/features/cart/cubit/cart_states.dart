import '../../../domain/entities/response/cart/get/get_cart_response.dart';

sealed class CartStates {}

class AddCartInitialState extends CartStates {}

class AddCartLoadingState extends CartStates {}

class AddCartErrorState extends CartStates {
  String errorMessage;
  AddCartErrorState({required this.errorMessage});
}

class AddCartSuccessState extends CartStates {
  int numOfCartItems;
  AddCartSuccessState({required this.numOfCartItems});
}

class GetCartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  String errorMessage;
  GetCartErrorState({required this.errorMessage});
}

class GetCartSuccessState extends CartStates {
  final GetCartResponse getCart;
  GetCartSuccessState({required this.getCart});
}

