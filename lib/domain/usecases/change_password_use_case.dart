import 'package:injectable/injectable.dart';

import '../entities/request/account/change_password_request.dart';
import '../entities/response/auth/auth_response.dart';
import '../repository/account/account_repository.dart';

@injectable
class ChangePasswordUseCase {
  final AccountRepository accountRepository;

  ChangePasswordUseCase(this.accountRepository);

  Future<AuthResponse> invoke(ChangePasswordRequest request) {
    return accountRepository.changePassword(request);
  }
}
