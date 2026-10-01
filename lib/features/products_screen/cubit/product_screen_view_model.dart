import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../domain/entities/response/product/product.dart';
import '../../../domain/usecases/get_all_products_use_case.dart';
import 'product_screen_states.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  final GetAllProductsUseCase _getAllProductsUseCase;

  List<Product>? productsList;

  ProductScreenViewModel(this._getAllProductsUseCase)
      : super(ProductLoadingState());

  void getProducts() async {
    try {
      emit(ProductLoadingState());
      var response = await _getAllProductsUseCase.invoke();
      productsList = response?.data;
      emit(ProductSuccessState(productsList: productsList));
    } on AppException catch (e) {
      emit(ProductErrorState(errorMessage: e.message));
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }
}
