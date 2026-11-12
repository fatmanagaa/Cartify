import '../../../domain/entities/request/account/add_address_request.dart';
import '../../../domain/entities/response/account/address.dart';
import '../../../domain/entities/response/account/addresses_response.dart';
import '../../model/request/account/add_address_request_dto.dart';
import '../../model/response/account/address_dto.dart';
import '../../model/response/account/addresses_response_dto.dart';

extension AddressDtoMapper on AddressDto {
  Address toAddress() {
    return Address(
      id: id,
      name: name,
      details: details,
      phone: phone,
      city: city,
    );
  }
}

extension AddressesResponseDtoMapper on AddressesResponseDto {
  AddressesResponse toAddressesResponse() {
    return AddressesResponse(
      status: status,
      message: message,
      data: data?.map((e) => e.toAddress()).toList(),
    );
  }
}

extension AddAddressRequestMapper on AddAddressRequest {
  AddAddressRequestDto toDto() {
    return AddAddressRequestDto(
      name: name,
      details: details,
      phone: phone,
      city: city,
    );
  }
}
