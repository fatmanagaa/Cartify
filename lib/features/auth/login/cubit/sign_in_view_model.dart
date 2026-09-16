import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../domain/entities/request/auth/login/login_request.dart';
import '../../../../domain/usecases/login_use_case.dart';
import '../../auth_states.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(AuthInitialState());

  //todo: hold data - handle logic

  Future<void> login({required String email, required String password}) async {
    try {
      emit(AuthLoadingState());
      LoginRequest loginRequest = LoginRequest(
        password: password,
        email: email,
      );
      var authResponse = await _loginUseCase.invoke(loginRequest);
      emit(AuthSuccessState(authResponse: authResponse));
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'UnExpected Error';
      emit(AuthErrorState(errorMessage: ServerException(message: message)));
    } on AppException catch (e) {
      emit(AuthErrorState(errorMessage: ServerException(message: e.message)));
    } catch (e) {
      emit(AuthErrorState(
          errorMessage: UnexpectedException(message: e.toString())));
    }
  }
}
//todo: view => object viewModel
//todo: viewModel => object UseCase
//todo: UseCase => object Repository
//todo: Repository => object Remote DS
//todo: Remote DS  => object ApiServices
///we need to solve this dependency by dependency injection by injectable pacakage
