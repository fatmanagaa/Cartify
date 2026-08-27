import '../../../../domain/entities/request/auth/login/login_request.dart';
import '../../../../domain/entities/request/auth/register/register_request.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}