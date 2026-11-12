import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/data_source/local/auth/auth_local_data_source.dart';
import '../../../../../domain/entities/request/account/add_address_request.dart';
import '../../../../../domain/entities/request/account/change_password_request.dart';
import '../../../../../domain/entities/request/account/update_user_data_request.dart';
import '../../../../../domain/entities/response/account/address.dart';
import '../../../../../domain/entities/response/auth/user.dart';
import '../../../../../domain/usecases/add_address_use_case.dart';
import '../../../../../domain/usecases/change_password_use_case.dart';
import '../../../../../domain/usecases/delete_address_use_case.dart';
import '../../../../../domain/usecases/get_addresses_use_case.dart';
import '../../../../../domain/usecases/logout_use_case.dart';
import '../../../../../domain/usecases/update_user_data_use_case.dart';
import 'account_states.dart';

@injectable
class AccountViewModel extends Cubit<AccountStates> {
  final LogoutUseCase _logoutUseCase;
  final UpdateUserDataUseCase _updateUserDataUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final GetAddressesUseCase _getAddressesUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final AuthLocalDataSource _authLocalDataSource;

  User? currentUser;
  List<Address> addresses = [];

  AccountViewModel(
    this._logoutUseCase,
    this._updateUserDataUseCase,
    this._changePasswordUseCase,
    this._getAddressesUseCase,
    this._addAddressUseCase,
    this._deleteAddressUseCase,
    this._authLocalDataSource,
  ) : super(AccountInitialState());

  Future<void> loadAccountData() async {
    try {
      emit(AccountLoadingState());
      currentUser = await _authLocalDataSource.getUser();
      try {
        final addressResponse = await _getAddressesUseCase.invoke();
        if (addressResponse.data != null) {
          addresses = addressResponse.data!;
        }
      } catch (_) {}
      emit(AccountLoadedState(user: currentUser, addresses: addresses));
    } catch (e) {
      emit(AccountLoadedState(user: currentUser, addresses: addresses));
    }
  }

  Future<void> updateUserData({
    String? name,
    String? email,
    String? phone,
  }) async {
    try {
      emit(UpdateUserDataLoadingState());
      final response = await _updateUserDataUseCase.invoke(
        UpdateUserDataRequest(
          name: name,
          email: email,
          phone: phone,
        ),
      );
      if (response.user != null) {
        currentUser = response.user;
        await _authLocalDataSource.saveUser(currentUser!);
      } else {
        currentUser = User(
          name: (name != null && name.isNotEmpty) ? name : currentUser?.name,
          email: (email != null && email.isNotEmpty) ? email : currentUser?.email,
          phone: (phone != null && phone.isNotEmpty) ? phone : currentUser?.phone,
        );
        await _authLocalDataSource.saveUser(currentUser!);
      }
      emit(UpdateUserDataSuccessState(
        message: 'Profile updated successfully',
        updatedUser: currentUser,
      ));
      emit(AccountLoadedState(user: currentUser, addresses: addresses));
    } catch (e) {
      emit(UpdateUserDataErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String password,
    required String rePassword,
  }) async {
    try {
      emit(ChangePasswordLoadingState());
      final response = await _changePasswordUseCase.invoke(
        ChangePasswordRequest(
          currentPassword: currentPassword,
          password: password,
          rePassword: rePassword,
        ),
      );
      emit(ChangePasswordSuccessState(
        message: response.message ?? 'Password changed successfully',
      ));
    } catch (e) {
      emit(ChangePasswordErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addAddress({
    required String details,
    String? name,
    String? phone,
    String? city,
  }) async {
    try {
      final response = await _addAddressUseCase.invoke(
        AddAddressRequest(
          name: name ?? 'Home',
          details: details,
          phone: phone ?? '',
          city: city ?? 'Cairo',
        ),
      );
      if (response.data != null) {
        addresses = response.data!;
      }
      emit(AccountLoadedState(user: currentUser, addresses: addresses));
    } catch (e) {
      emit(AccountErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AccountLogoutLoadingState());
      final isLoggedOut = await _logoutUseCase.invoke();
      if (isLoggedOut) {
        emit(AccountLogoutSuccessState());
      } else {
        emit(AccountLogoutErrorState(
            errorMessage: 'Failed to logout. Please try again.'));
      }
    } catch (e) {
      emit(AccountLogoutErrorState(errorMessage: e.toString()));
    }
  }
}
