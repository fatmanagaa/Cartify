import 'package:injectable/injectable.dart';

import '../entities/response/account/addresses_response.dart';
import '../repository/account/account_repository.dart';

@injectable
class GetAddressesUseCase {
  final AccountRepository accountRepository;

  GetAddressesUseCase(this.accountRepository);

  Future<AddressesResponse> invoke() {
    return accountRepository.getAddresses();
  }
}
