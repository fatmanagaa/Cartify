import 'package:ecommerce_app/api/data_source/local/auth/auth_local_data_source_implementation.dart';
import 'package:ecommerce_app/core/cache/shared_prefs_utils.dart';
import 'package:ecommerce_app/data/repository/auth/auth_repository_implementation.dart';
import 'package:ecommerce_app/domain/entities/request/auth/login/login_request.dart';
import 'package:ecommerce_app/domain/entities/request/auth/register/register_request.dart';
import 'package:ecommerce_app/domain/entities/response/auth/auth_response.dart';
import 'package:ecommerce_app/domain/usecases/delete_token_use_case.dart';
import 'package:ecommerce_app/domain/usecases/get_token_use_case.dart';
import 'package:ecommerce_app/domain/usecases/save_token_use_case.dart';
import 'package:ecommerce_app/features/splash/cubit/splash_states.dart';
import 'package:ecommerce_app/features/splash/cubit/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/auth_remote_data_source.dart';

class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  String? mockToken;

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return AuthResponse(token: mockToken ?? 'mock_login_token');
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    return AuthResponse(token: mockToken ?? 'mock_register_token');
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPrefsUtils & Auto Login Tests', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await SharedPrefsUtils.init();
    });

    test('SharedPrefsUtils saves, retrieves, and deletes token correctly', () async {
      expect(SharedPrefsUtils.getToken(), null);
      expect(SharedPrefsUtils.hasToken(), false);

      await SharedPrefsUtils.saveToken('test_token_123');
      expect(SharedPrefsUtils.getToken(), 'test_token_123');
      expect(SharedPrefsUtils.hasToken(), true);

      await SharedPrefsUtils.deleteToken();
      expect(SharedPrefsUtils.getToken(), null);
      expect(SharedPrefsUtils.hasToken(), false);
    });

    test('AuthRepository saves token automatically on login', () async {
      final remoteDataSource = MockAuthRemoteDataSource();
      final localDataSource = AuthLocalDataSourceImpl();
      final repository = AuthRepositoryImplementation(remoteDataSource, localDataSource);

      expect(await repository.getToken(), null);

      final response = await repository.login(
        LoginRequest(email: 'test@example.com', password: 'password123'),
      );

      expect(response.token, 'mock_login_token');
      expect(await repository.getToken(), 'mock_login_token');
    });

    test('UseCases operate on cached token correctly', () async {
      final remoteDataSource = MockAuthRemoteDataSource();
      final localDataSource = AuthLocalDataSourceImpl();
      final repository = AuthRepositoryImplementation(remoteDataSource, localDataSource);

      final saveTokenUseCase = SaveTokenUseCase(repository);
      final getTokenUseCase = GetTokenUseCase(repository);
      final deleteTokenUseCase = DeleteTokenUseCase(repository);

      await saveTokenUseCase.invoke('usecase_token');
      expect(await getTokenUseCase.invoke(), 'usecase_token');

      await deleteTokenUseCase.invoke();
      expect(await getTokenUseCase.invoke(), null);
    });

    test('SplashViewModel emits AuthenticatedState when token exists', () async {
      await SharedPrefsUtils.saveToken('valid_token');
      final remoteDataSource = MockAuthRemoteDataSource();
      final localDataSource = AuthLocalDataSourceImpl();
      final repository = AuthRepositoryImplementation(remoteDataSource, localDataSource);
      final getTokenUseCase = GetTokenUseCase(repository);

      final viewModel = SplashViewModel(getTokenUseCase);

      expect(viewModel.state, isA<SplashInitialState>());

      final states = <SplashStates>[];
      final subscription = viewModel.stream.listen(states.add);

      await viewModel.checkAutoLogin();

      expect(viewModel.state, isA<AuthenticatedState>());
      expect(states.any((s) => s is AuthenticatedState), true);

      await subscription.cancel();
    });

    test('SplashViewModel emits UnAuthenticatedState when no token exists', () async {
      await SharedPrefsUtils.deleteToken();
      final remoteDataSource = MockAuthRemoteDataSource();
      final localDataSource = AuthLocalDataSourceImpl();
      final repository = AuthRepositoryImplementation(remoteDataSource, localDataSource);
      final getTokenUseCase = GetTokenUseCase(repository);

      final viewModel = SplashViewModel(getTokenUseCase);

      final states = <SplashStates>[];
      final subscription = viewModel.stream.listen(states.add);

      await viewModel.checkAutoLogin();

      expect(viewModel.state, isA<UnAuthenticatedState>());
      expect(states.any((s) => s is UnAuthenticatedState), true);

      await subscription.cancel();
    });
  });
}
