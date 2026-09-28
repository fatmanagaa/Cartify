import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/category/category_repository.dart';
import '../../data_source/remote/category/category_remote_data_source.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryImpl(this._categoryRemoteDataSource);


  @override
  Future<CategoryOrBrandResponse?> getCategories() {
    return _categoryRemoteDataSource.getCategories();
  }
}