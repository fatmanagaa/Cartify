import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../data/data_source/remote/product/product_remote_data_source.dart';
import '../../../../domain/entities/response/product/product.dart';
import '../../../retrofit/api_services.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiServices _apiServices;

  ProductRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      var productResponse = await _apiServices.getAllProducts();
      //todo: List<ProductDto> => List<Product>
      return productResponse.data
              ?.map((ProductDto prodDto) => prodDto.toProduct())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
