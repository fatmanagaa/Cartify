import '../../entities/request/auth/login/login_request.dart';
import '../../entities/request/auth/register/register_request.dart';
import '../../entities/response/auth/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
