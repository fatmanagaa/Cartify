import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/mapper/product/product_mapper.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../data/data_source/remote/product/product_remote_data_source.dart';
import '../../../../domain/entities/response/product/product_response.dart';
import '../../../mapper/product/product_response_dto_mapper.dart';
import '../../../retrofit/api_services.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImplementation implements ProductRemoteDataSource {
  final ApiServices apiServices;

  ProductRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<ProductResponse> getAllProducts() async {
    try {
      var productResponse = await apiServices.getAllProducts();
      return productResponse.toProductResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<Product?> getProductDetails(String productId) async {
    try {
      var response = await apiServices.getProductDetails(productId);
      return response.data?.toProduct();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
