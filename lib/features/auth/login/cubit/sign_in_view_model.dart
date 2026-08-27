import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/domain/usecases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/auth_states.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInViewModel extends Cubit<AuthStates> {
  final LoginUseCase loginUseCase;
  SignInViewModel(this.loginUseCase) : super(AuthLoading());



}
//todo: view => object viewModel
//todo: viewModel => object UseCase
//todo: UseCase => object Repository
//todo: Repository => object Remote DS
//todo: Remote DS  => object ApiServices
///we need to solve this dependency by dependency injection by injectable pacakage