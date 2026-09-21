import 'package:ecommerce_app/data/data_source/remote/brand/brand_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/response/category_brand/category_or_brand_response.dart';
import '../../../domain/repository/brand/brand_repository.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImplementation implements BrandRepository {
  BrandRemoteDataSource brandRemoteDataSource;

  BrandRepositoryImplementation(this.brandRemoteDataSource);

  @override
  Future<CategoryOrBrandResponse?> getBrands() async {
    return await brandRemoteDataSource.getBrands();
  }
}
