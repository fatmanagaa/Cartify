import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/brand/brand_remote_data_source.dart';
import '../../../../data/data_source/remote/category/category_remote_data_source.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImplementation implements CategoryRemoteDataSource {
  ApiServices apiServices;

  BrandRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<CategoryOrBrandResponse> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
