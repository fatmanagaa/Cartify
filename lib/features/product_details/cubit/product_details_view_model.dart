import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../domain/entities/response/product/product.dart';
import '../../../domain/usecases/get_product_details_use_case.dart';
import 'product_details_states.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsStates> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  Product? product;

  ProductDetailsViewModel(this._getProductDetailsUseCase)
      : super(ProductDetailsInitialState());

  void initProduct(Product? initialProduct) {
    if (initialProduct != null) {
      product = initialProduct;
      emit(ProductDetailsSuccessState(product: product));
      if (initialProduct.id != null) {
        getProductDetails(initialProduct.id!);
      }
    }
  }

  Future<void> getProductDetails(String productId) async {
    try {
      if (product == null) {
        emit(ProductDetailsLoadingState());
      }
      var result = await _getProductDetailsUseCase.invoke(productId);
      if (result != null) {
        product = result;
        emit(ProductDetailsSuccessState(product: product));
      } else if (product == null) {
        emit(ProductDetailsErrorState(errorMessage: 'Product details not found'));
      }
    } on AppException catch (e) {
      if (product == null) {
        emit(ProductDetailsErrorState(errorMessage: e.message));
      }
    } catch (e) {
      if (product == null) {
        emit(ProductDetailsErrorState(errorMessage: e.toString()));
      }
    }
  }
}
