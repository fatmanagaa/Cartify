import 'package:injectable/injectable.dart';

import '../entities/response/account/addresses_response.dart';
import '../repository/account/account_repository.dart';

@injectable
class DeleteAddressUseCase {
  final AccountRepository accountRepository;

  DeleteAddressUseCase(this.accountRepository);

  Future<AddressesResponse> invoke(String addressId) {
    return accountRepository.deleteAddress(addressId);
  }
}
