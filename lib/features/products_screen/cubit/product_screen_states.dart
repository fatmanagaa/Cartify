
import '../../../domain/entities/response/product/product.dart';

sealed class ProductScreenStates{}

class ProductLoadingState extends ProductScreenStates{}

class ProductErrorState extends ProductScreenStates{
  String errorMessage ;
  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductScreenStates{
  List<Product>? productsList ;
  ProductSuccessState({required this.productsList});
}