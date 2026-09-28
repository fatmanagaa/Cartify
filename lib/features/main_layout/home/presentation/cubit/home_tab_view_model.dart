import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../domain/entities/response/comman/category_brand.dart';
import '../../../../../domain/usecases/get_all_brands_use_case.dart';
import '../../../../../domain/usecases/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllBrandsUseCase _getAllBrandsUseCase;

  List<CategoryBrand>? categoriesList;
  List<CategoryBrand>? brandsList;

  HomeTabViewModel(
    this._getAllCategoriesUseCase,
    this._getAllBrandsUseCase,
  ) : super(HomeTabInitialState());

  void getCategories() async {
    try {
      emit(CategoryLoadingState());
      var response = await _getAllCategoriesUseCase.invoke();
      categoriesList = response?.data;
      emit(CategorySuccessState(categoriesList: categoriesList ?? []));
    } on AppException catch (e) {
      emit(CategoryErrorState(errorMessage: e.message));
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }

  void getBrands() async {
    try {
      emit(BrandLoadingState());
      var response = await _getAllBrandsUseCase.invoke();
      brandsList = response?.data;
      emit(BrandSuccessState(brandsList: brandsList ?? []));
    } on AppException catch (e) {
      emit(BrandErrorState(errorMessage: e.message));
    } catch (e) {
      emit(BrandErrorState(errorMessage: e.toString()));
    }
  }
}
