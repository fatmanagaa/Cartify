import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../domain/entities/response/comman/category_brand.dart';
import '../../../../../domain/entities/response/product/sub_category.dart';
import '../../../../../domain/usecases/get_all_categories_use_case.dart';
import '../../../../../domain/usecases/get_all_sub_categories.dart';
import 'categories_tab_states.dart';

@injectable
class CategoriesTabViewModel extends Cubit<CategoriesTabStates> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllSubCategories _getAllSubCategoriesUseCase;

  List<CategoryBrand>? categoriesList;
  List<SubCategory>? subCategoriesList;
  int selectedIndex = 0;

  CategoriesTabViewModel(
    this._getAllCategoriesUseCase,
    this._getAllSubCategoriesUseCase,
  ) : super(CategoriesTabInitialState());

  void getCategories({String? selectedCategoryId}) async {
    try {
      emit(CategoryLoadingState());
      var response = await _getAllCategoriesUseCase.invoke();
      categoriesList = response?.data;
      final categoryList = categoriesList ?? [];
      emit(CategorySuccessState(categoryList));

      if (categoryList.isEmpty) return;

      if (selectedCategoryId != null && selectedCategoryId.isNotEmpty) {
        final matchedIndex = categoryList.indexWhere(
          (category) => category.id == selectedCategoryId,
        );
        if (matchedIndex >= 0) {
          selectedIndex = matchedIndex;
          emit(ChangeSelectedCategoryState(selectedIndex));
          getSubCategories(selectedCategoryId);
          return;
        }
      }

      final firstCategoryId = categoryList[0].id;
      if (firstCategoryId != null) {
        selectedIndex = 0;
        emit(ChangeSelectedCategoryState(selectedIndex));
        getSubCategories(firstCategoryId);
      }
    } on AppException catch (e) {
      emit(CategoryErrorState(e.message));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  void getSubCategories(String categoryId) async {
    try {
      emit(SubCategoryLoadingState());
      var response = await _getAllSubCategoriesUseCase.invoke(categoryId);
      subCategoriesList = response;
      emit(SubCategorySuccessState(subCategoriesList ?? []));
    } on AppException catch (e) {
      emit(SubCategoryErrorState(e.message));
    } catch (e) {
      emit(SubCategoryErrorState(e.toString()));
    }
  }

  void changeSelectedCategory(int index) {
    if (selectedIndex == index) return;
    selectedIndex = index;
    emit(ChangeSelectedCategoryState(selectedIndex));
    if (categoriesList != null && index < categoriesList!.length) {
      final categoryId = categoriesList![index].id;
      if (categoryId != null) {
        getSubCategories(categoryId);
      }
    }
  }
}
