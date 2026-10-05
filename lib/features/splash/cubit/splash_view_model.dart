import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/get_token_use_case.dart';
import 'splash_states.dart';

@injectable
class SplashViewModel extends Cubit<SplashStates> {
  final GetTokenUseCase _getTokenUseCase;

  SplashViewModel(this._getTokenUseCase) : super(SplashInitialState());

  Future<void> checkAutoLogin() async {
    emit(SplashLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final token = await _getTokenUseCase.invoke();
    if (token != null && token.isNotEmpty) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }
}
