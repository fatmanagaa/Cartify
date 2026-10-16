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

class UpdateCartInitialState extends CartStates {}

class UpdateCountLoadingState extends CartStates {}

class UpdateCountErrorState extends CartStates {
  String errorMessage;

  UpdateCountErrorState({required this.errorMessage});
}

class UpdateCountSuccessState extends CartStates {
  int numOfCartItems;

  UpdateCountSuccessState({required this.numOfCartItems});
}

class DeleteCartInitialState extends CartStates {}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartErrorState extends CartStates {
  String errorMessage;

  DeleteCartErrorState({required this.errorMessage});
}

class DeleteCartSuccessState extends CartStates {
  int numOfCartItems;

  DeleteCartSuccessState({required this.numOfCartItems});
}
