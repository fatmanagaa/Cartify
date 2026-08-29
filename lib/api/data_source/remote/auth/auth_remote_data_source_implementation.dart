import 'package:ecommerce_app/api/api_services.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/auth/auth_remote_data_source.dart';
import '../../../../domain/entities/request/auth/login/login_request.dart';
import '../../../../domain/entities/request/auth/register/register_request.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final ApiServices apiServices;
  AuthRemoteDataSourceImplementation(this.apiServices);
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    // TODO: Implement login API call
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    // TODO: Implement register API call
    throw UnimplementedError();
  }
}