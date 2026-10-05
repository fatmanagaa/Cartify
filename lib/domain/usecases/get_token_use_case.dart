import 'package:injectable/injectable.dart';
import '../repository/auth/auth_repository.dart';

@injectable
class GetTokenUseCase {
  final AuthRepository _authRepository;

  GetTokenUseCase(this._authRepository);

  Future<String?> invoke() {
    return _authRepository.getToken();
  }
}
