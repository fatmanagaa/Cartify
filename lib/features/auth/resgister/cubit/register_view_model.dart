import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../domain/entities/request/auth/register/register_request.dart';
import '../../../../domain/usecases/register_use_case.dart';
import '../../auth_states.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(AuthLoadingState());

  //todo: hold data - handle logic

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String rePassword,
    required String phone,
  }) async {
    try {
      emit(AuthLoadingState());
      RegisterRequest registerRequest = RegisterRequest(
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
        name: name,
      );
      var authResponse = await _registerUseCase.invoke(registerRequest);
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
