import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefs_utils.dart';
import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../data/data_source/remote/account/account_remote_data_source.dart';
import '../../../../domain/entities/request/account/add_address_request.dart';
import '../../../../domain/entities/request/account/change_password_request.dart';
import '../../../../domain/entities/request/account/update_user_data_request.dart';
import '../../../../domain/entities/response/account/addresses_response.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';
import '../../../mapper/account/address_mapper.dart';
import '../../../mapper/account/change_password_mapper.dart';
import '../../../mapper/account/update_user_data_mapper.dart';
import '../../../mapper/auth/auth_response_mapper.dart';
import '../../../retrofit/api_services.dart';

@Injectable(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImplementation implements AccountRemoteDataSource {
  final ApiServices _apiServices;

  AccountRemoteDataSourceImplementation(this._apiServices);

  String _getToken() {
    final token = SharedPrefsUtils.getToken() ?? SharedPrefsUtils.getData(key: 'token')?.toString();
    return token ?? '';
  }

  @override
  Future<AuthResponse> updateUserData(UpdateUserDataRequest request) async {
    try {
      final token = _getToken();
      final response = await _apiServices.updateUserData(request.toDto(), token);
      return response.toAuthResponse();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      throw ServerException(message: e.message ?? 'Update user failed');
    }
  }

  @override
  Future<AuthResponse> changePassword(ChangePasswordRequest request) async {
    try {
      final token = _getToken();
      final response = await _apiServices.changePassword(request.toDto(), token);
      return response.toAuthResponse();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      throw ServerException(message: e.message ?? 'Change password failed');
    }
  }

  @override
  Future<AddressesResponse> getAddresses() async {
    try {
      final token = _getToken();
      final response = await _apiServices.getAddresses(token);
      return response.toAddressesResponse();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      throw ServerException(message: e.message ?? 'Get addresses failed');
    }
  }

  @override
  Future<AddressesResponse> addAddress(AddAddressRequest request) async {
    try {
      final token = _getToken();
      final response = await _apiServices.addAddress(request.toDto(), token);
      return response.toAddressesResponse();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      throw ServerException(message: e.message ?? 'Add address failed');
    }
  }

  @override
  Future<AddressesResponse> deleteAddress(String addressId) async {
    try {
      final token = _getToken();
      final response = await _apiServices.deleteAddress(addressId, token);
      return response.toAddressesResponse();
    } on DioException catch (e) {
      if (e.error is AppException) {
        throw e.error as AppException;
      }
      throw ServerException(message: e.message ?? 'Delete address failed');
    }
  }
}
