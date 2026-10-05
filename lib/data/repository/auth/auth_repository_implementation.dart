import 'package:ecommerce_app/domain/entities/request/auth/login/login_request.dart';
import 'package:ecommerce_app/domain/entities/request/auth/register/register_request.dart';
import 'package:ecommerce_app/domain/entities/response/auth/auth_response.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data_source/local/auth/auth_local_data_source.dart';
import '../../data_source/remote/auth/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImplementation(
    this.authRemoteDataSource,
    this.authLocalDataSource,
  );

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    final response = await authRemoteDataSource.login(loginRequest);
    if (response.token != null && response.token!.isNotEmpty) {
      await authLocalDataSource.saveToken(response.token!);
    }
    return response;
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    final response = await authRemoteDataSource.register(registerRequest);
    if (response.token != null && response.token!.isNotEmpty) {
      await authLocalDataSource.saveToken(response.token!);
    }
    return response;
  }

  @override
  Future<bool> saveToken(String token) {
    return authLocalDataSource.saveToken(token);
  }

  @override
  Future<String?> getToken() {
    return authLocalDataSource.getToken();
  }

  @override
  Future<bool> deleteToken() {
    return authLocalDataSource.deleteToken();
  }
}
