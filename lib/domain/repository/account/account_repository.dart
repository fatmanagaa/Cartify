import '../../entities/request/account/add_address_request.dart';
import '../../entities/request/account/change_password_request.dart';
import '../../entities/request/account/update_user_data_request.dart';
import '../../entities/response/account/addresses_response.dart';
import '../../entities/response/auth/auth_response.dart';

abstract class AccountRepository {
  Future<AuthResponse> updateUserData(UpdateUserDataRequest request);

  Future<AuthResponse> changePassword(ChangePasswordRequest request);

  Future<AddressesResponse> getAddresses();

  Future<AddressesResponse> addAddress(AddAddressRequest request);

  Future<AddressesResponse> deleteAddress(String addressId);
}
