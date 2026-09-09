import 'package:ecommerce_app/domain/entities/request/auth/register/register_request.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/response/auth/auth_response.dart';

@injectable
class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<AuthResponse> invoke(RegisterRequest registerRequest)  {
    return authRepository.register(registerRequest);
  }
}
