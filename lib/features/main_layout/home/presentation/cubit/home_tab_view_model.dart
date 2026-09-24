import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exceptions.dart';
import '../../../../../domain/usecases/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;

  HomeTabViewModel(this._getAllCategoriesUseCase) : super(HomeTabInitialState());

  void getCategories() async {
    try {
      emit(CategoryLoadingState());
      var response = await _getAllCategoriesUseCase.invoke();
      emit(CategorySuccessState(categoriesList: response?.data ?? []));
    } on AppException catch (e) {
      emit(CategoryErrorState(errorMessage: e.message));
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}