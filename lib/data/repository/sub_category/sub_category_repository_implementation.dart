import 'package:ecommerce_app/domain/entities/response/product/sub_category.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/sub_category/sub_category_repository.dart';
import '../../data_source/remote/sub_category/sub_category_remote_data_source.dart';

@Injectable(as: SubCategoryRepository)
class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final SubCategoryRemoteDataSource _subCategoryRemoteDataSource;

  SubCategoryRepositoryImpl(this._subCategoryRemoteDataSource);

  @override
  Future<List<SubCategory>> getSubCategories(String categoryId) {
    return _subCategoryRemoteDataSource.getSubCategories(categoryId);
  }
}
