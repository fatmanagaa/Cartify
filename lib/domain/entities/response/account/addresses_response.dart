import 'address.dart';

class AddressesResponse {
  final String? status;
  final String? message;
  final List<Address>? data;

  AddressesResponse({
    this.status,
    this.message,
    this.data,
  });
}
