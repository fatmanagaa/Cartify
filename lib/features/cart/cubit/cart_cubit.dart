import 'package:ecommerce_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:ecommerce_app/domain/usecases/get_items_in_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../domain/usecases/add_to_cart_use_case.dart';
import 'cart_states.dart';

@lazySingleton
class CartScreenViewModel extends Cubit<CartStates> {
  final AddToCartUseCase _addToCartUseCase;
  final GetItemsInCartUseCase _getCartUseCase;

  CartScreenViewModel(this._addToCartUseCase, this._getCartUseCase)
      : super(AddCartInitialState());

  int numOfCartItems = 0;
  GetCartResponse? cartResponse;

  void addProductToCart(String productId) async {
    try {
      emit(AddCartLoadingState());
      var addProductResponse = await _addToCartUseCase.invoke(productId);
      numOfCartItems = addProductResponse.numOfCartItems ?? 0;
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
      getItemsInCart();
    } on AppException catch (e) {
      emit(AddCartErrorState(errorMessage: e.message));
    } catch (e) {
      emit(AddCartErrorState(errorMessage: e.toString()));
    }
  }

  void getItemsInCart() async {
    try {
      emit(GetCartLoadingState());
      var getCartResponse = await _getCartUseCase.invoke();
      if (getCartResponse != null) {
        cartResponse = getCartResponse;
        numOfCartItems = getCartResponse.numOfCartItems ?? 0;
        emit(GetCartSuccessState(getCart: getCartResponse));
      } else {
        emit(GetCartErrorState(errorMessage: "Failed to fetch cart items"));
      }
    } on AppException catch (e) {
      emit(GetCartErrorState(errorMessage: e.message));
    } catch (e) {
      emit(GetCartErrorState(errorMessage: e.toString()));
    }
  }
}
