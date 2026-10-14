import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/add_to_cart_use_case.dart';
import 'cart_states.dart';

@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  final AddToCartUseCase _addToCartUseCase;

  CartScreenViewModel(this._addToCartUseCase) : super(AddCartInitialState());

  //todo: hold data - handle logic
  int numOfCartItems = 0;

  void addProductToCart(String productId) async {
    try {
      var addProductResponse = await _addToCartUseCase.invoke(productId);
      numOfCartItems = addProductResponse.numOfCartItems ?? 0;
      print(object: 'numOfCartItems: $numOfCartItems');
      emit(state: AddCartSuccessState(numOfCartItems: numOfCartItems));
    } on AppException catch (e) {
      emit(state: AddCartErrorState(errorMessage: e.message));
    }
  }
}