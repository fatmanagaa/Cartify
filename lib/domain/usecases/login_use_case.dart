import 'package:ecommerce_app/domain/entities/request/auth/login/login_request.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/auth/auth_response.dart';
@injectable
class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<AuthResponse> invoke(LoginRequest loginRequest) {
    return  authRepository.login(loginRequest);
  }
}
