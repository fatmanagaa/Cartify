sealed class AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {}

class AuthFailure extends AuthStates {
  final String error;

  AuthFailure({required this.error});
}
