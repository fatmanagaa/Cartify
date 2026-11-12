import 'package:injectable/injectable.dart';

import '../../../domain/entities/request/account/add_address_request.dart';
import '../../../domain/entities/request/account/change_password_request.dart';
import '../../../domain/entities/request/account/update_user_data_request.dart';
import '../../../domain/entities/response/account/addresses_response.dart';
import '../../../domain/entities/response/auth/auth_response.dart';
import '../../../domain/repository/account/account_repository.dart';
import '../../data_source/local/auth/auth_local_data_source.dart';
import '../../data_source/remote/account/account_remote_data_source.dart';

@Injectable(as: AccountRepository)
class AccountRepositoryImplementation implements AccountRepository {
  final AccountRemoteDataSource _accountRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AccountRepositoryImplementation(
    this._accountRemoteDataSource,
    this._authLocalDataSource,
  );

  @override
  Future<AuthResponse> updateUserData(UpdateUserDataRequest request) async {
    final response = await _accountRemoteDataSource.updateUserData(request);
    if (response.token != null && response.token!.isNotEmpty) {
      await _authLocalDataSource.saveToken(response.token!);
    }
    if (response.user != null) {
      await _authLocalDataSource.saveUser(response.user!);
    }
    return response;
  }

  @override
  Future<AuthResponse> changePassword(ChangePasswordRequest request) async {
    final response = await _accountRemoteDataSource.changePassword(request);
    if (response.token != null && response.token!.isNotEmpty) {
      await _authLocalDataSource.saveToken(response.token!);
    }
    return response;
  }

  @override
  Future<AddressesResponse> getAddresses() async {
    return await _accountRemoteDataSource.getAddresses();
  }

  @override
  Future<AddressesResponse> addAddress(AddAddressRequest request) async {
    return await _accountRemoteDataSource.addAddress(request);
  }

  @override
  Future<AddressesResponse> deleteAddress(String addressId) async {
    return await _accountRemoteDataSource.deleteAddress(addressId);
  }
}
