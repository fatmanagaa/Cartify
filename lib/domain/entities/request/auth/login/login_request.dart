
import 'package:ecommerce_app/api/model/request/auth/login/login_request_dto.dart';

class LoginRequest {
  final String? email;
  final String? password;

  LoginRequest ({
    this.email,
    this.password,
  });

}


