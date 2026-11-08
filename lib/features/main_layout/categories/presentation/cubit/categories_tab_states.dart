import '../../../../../domain/entities/response/comman/category_brand.dart';
import '../../../../../domain/entities/response/product/sub_category.dart';

abstract class CategoriesTabStates {}

class CategoriesTabInitialState extends CategoriesTabStates {}

class CategoryLoadingState extends CategoriesTabStates {}

class CategorySuccessState extends CategoriesTabStates {
  final List<CategoryBrand> categoriesList;
  CategorySuccessState(this.categoriesList);
}

class CategoryErrorState extends CategoriesTabStates {
  final String errorMessage;
  CategoryErrorState(this.errorMessage);
}

class SubCategoryLoadingState extends CategoriesTabStates {}

class SubCategorySuccessState extends CategoriesTabStates {
  final List<SubCategory> subCategoriesList;
  SubCategorySuccessState(this.subCategoriesList);
}

class SubCategoryErrorState extends CategoriesTabStates {
  final String errorMessage;
  SubCategoryErrorState(this.errorMessage);
}

class ChangeSelectedCategoryState extends CategoriesTabStates {
  final int selectedIndex;
  ChangeSelectedCategoryState(this.selectedIndex);
}
