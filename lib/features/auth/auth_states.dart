import '../../core/exceptions/app_exceptions.dart';
import '../../domain/entities/response/auth/auth_response.dart';

sealed class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  AppException errorMessage;

  AuthErrorState({required this.errorMessage});
}

class AuthSuccessState extends AuthStates {
  AuthResponse authResponse;

  AuthSuccessState({required this.authResponse});
}