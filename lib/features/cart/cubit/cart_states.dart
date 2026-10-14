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