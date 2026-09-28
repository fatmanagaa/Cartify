import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../data/data_source/remote/brand/brand_remote_data_source.dart';
import '../../../mapper/category_brand/category_or_brand_dto_response_mapper.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImplementation implements BrandRemoteDataSource {
  final ApiServices apiServices;

  BrandRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<CategoryOrBrandResponse> getAllBrands() async {
    try {
      var brandResponse = await apiServices.getBrands();
      return brandResponse.toCategoryOrBrandResponse();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
