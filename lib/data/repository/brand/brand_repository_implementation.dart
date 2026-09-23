import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/data_source/remote/brand/brand_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../domain/entities/response/category_brand/category_or_brand_response.dart';
import '../../../domain/repository/brand/brand_repository.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository{
  final BrandRemoteDataSource _brandRemoteDataSource;

  BrandRepositoryImpl(this._brandRemoteDataSource);

  @override
  Future<CategoryOrBrandResponse?> getAllBrands() {
    try{
      return _brandRemoteDataSource.getAllBrands();
    }on DioException catch(e){
      String message = (e.error as AppException).message ;
      throw ServerException(message: message);
    }
  }
}
