import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecases/logout_use_case.dart';
import 'profile_states.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final LogoutUseCase _logoutUseCase;

  ProfileViewModel(this._logoutUseCase) : super(ProfileInitialState());

  Future<void> logout() async {
    try {
      emit(ProfileLogoutLoadingState());
      final isLoggedOut = await _logoutUseCase.invoke();
      if (isLoggedOut) {
        emit(ProfileLogoutSuccessState());
      } else {
        emit(ProfileLogoutErrorState(
            errorMessage: 'Failed to logout. Please try again.'));
      }
    } catch (e) {
      emit(ProfileLogoutErrorState(errorMessage: e.toString()));
    }
  }
}
