import '../../../../../domain/entities/response/comman/category_brand.dart';

sealed class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  String errorMessage;

  CategoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends HomeTabStates {
  List<CategoryBrand> categoriesList;

  CategorySuccessState({required this.categoriesList});
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  String errorMessage;

  BrandErrorState({required this.errorMessage});
}

class BrandSuccessState extends HomeTabStates {
  List<CategoryBrand> brandsList;

  BrandSuccessState({required this.brandsList});
}
