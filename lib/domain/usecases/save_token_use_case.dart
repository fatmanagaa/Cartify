import 'package:injectable/injectable.dart';
import '../repository/auth/auth_repository.dart';

@injectable
class SaveTokenUseCase {
  final AuthRepository _authRepository;

  SaveTokenUseCase(this._authRepository);

  Future<bool> invoke(String token) {
    return _authRepository.saveToken(token);
  }
}
