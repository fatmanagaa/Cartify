import 'package:injectable/injectable.dart';

import '../entities/request/account/update_user_data_request.dart';
import '../entities/response/auth/auth_response.dart';
import '../repository/account/account_repository.dart';

@injectable
class UpdateUserDataUseCase {
  final AccountRepository accountRepository;

  UpdateUserDataUseCase(this.accountRepository);

  Future<AuthResponse> invoke(UpdateUserDataRequest request) {
    return accountRepository.updateUserData(request);
  }
}
