import 'package:injectable/injectable.dart';
import '../repository/auth/auth_repository.dart';

@injectable
class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<bool> invoke() {
    return _authRepository.logout();
  }
}
