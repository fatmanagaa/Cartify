import 'package:injectable/injectable.dart';

import '../entities/request/account/add_address_request.dart';
import '../entities/response/account/addresses_response.dart';
import '../repository/account/account_repository.dart';

@injectable
class AddAddressUseCase {
  final AccountRepository accountRepository;

  AddAddressUseCase(this.accountRepository);

  Future<AddressesResponse> invoke(AddAddressRequest request) {
    return accountRepository.addAddress(request);
  }
}
