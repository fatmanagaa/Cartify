import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../domain/entities/response/category_brand/category_or_brand_response.dart';
import '../../../domain/repository/category/category_repository.dart';
import '../../data_source/remote/category/category_remote_data_source.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(this._categoryRemoteDataSource);

  @override
  Future<CategoryOrBrandResponse?> getCategories() async {
    try {
      return await _categoryRemoteDataSource.getCategories();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
