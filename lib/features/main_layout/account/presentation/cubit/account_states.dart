import '../../../../../domain/entities/response/account/address.dart';
import '../../../../../domain/entities/response/auth/user.dart';

abstract class AccountStates {}

class AccountInitialState extends AccountStates {}

class AccountLoadingState extends AccountStates {}

class AccountLoadedState extends AccountStates {
  final User? user;
  final List<Address>? addresses;

  AccountLoadedState({this.user, this.addresses});
}

class AccountErrorState extends AccountStates {
  final String errorMessage;

  AccountErrorState({required this.errorMessage});
}

class UpdateUserDataLoadingState extends AccountStates {}

class UpdateUserDataSuccessState extends AccountStates {
  final String message;
  final User? updatedUser;

  UpdateUserDataSuccessState({required this.message, this.updatedUser});
}

class UpdateUserDataErrorState extends AccountStates {
  final String errorMessage;

  UpdateUserDataErrorState({required this.errorMessage});
}

class ChangePasswordLoadingState extends AccountStates {}

class ChangePasswordSuccessState extends AccountStates {
  final String message;

  ChangePasswordSuccessState({required this.message});
}

class ChangePasswordErrorState extends AccountStates {
  final String errorMessage;

  ChangePasswordErrorState({required this.errorMessage});
}

class AccountLogoutLoadingState extends AccountStates {}

class AccountLogoutSuccessState extends AccountStates {}

class AccountLogoutErrorState extends AccountStates {
  final String errorMessage;

  AccountLogoutErrorState({required this.errorMessage});
}
