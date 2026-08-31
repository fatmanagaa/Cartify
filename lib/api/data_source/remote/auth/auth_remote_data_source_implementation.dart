import 'package:injectable/injectable.dart';
import '../../../../data/data_source/remote/auth/auth_remote_data_source.dart';
import '../../../../domain/entities/request/auth/login/login_request.dart';
import '../../../../domain/entities/request/auth/register/register_request.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';
import '../../../api_services.dart';
import '../../../mapper/auth/auth_response_mapper.dart';
import '../../../mapper/auth/login_request_mapper.dart';
import '../../../mapper/auth/register_request_mapper.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices _apiServices;

  AuthRemoteDataSourceImpl(this._apiServices);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    //todo: LoginRequest => LoginRequestDto
    var authResponse =
        await _apiServices.login(loginRequest.toLoginRequestDto());
    //todo: AuthResponseDto => AuthResponse
    return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    //todo: RegisterRequest => RegisterRequestDto
    var authResponse =
        await _apiServices.register(registerRequest.toRegisterRequestDto());
    //todo: AuthResponseDto => AuthResponse
    return authResponse.toAuthResponse();
  }
}
