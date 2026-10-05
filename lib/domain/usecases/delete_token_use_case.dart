import 'package:injectable/injectable.dart';
import '../repository/auth/auth_repository.dart';

@injectable
class DeleteTokenUseCase {
  final AuthRepository _authRepository;

  DeleteTokenUseCase(this._authRepository);

  Future<bool> invoke() {
    return _authRepository.deleteToken();
  }
}
