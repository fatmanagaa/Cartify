import 'package:ecommerce_app/domain/entities/request/auth/login/login_request.dart';
import 'package:ecommerce_app/domain/entities/request/auth/register/register_request.dart';
import 'package:ecommerce_app/domain/entities/response/auth/auth_response.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data_source/remote/auth/auth_remote_data_source.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplementation(this.authRemoteDataSource);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }
}
