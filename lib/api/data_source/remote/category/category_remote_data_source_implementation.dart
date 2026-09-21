import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/category/category_remote_data_source.dart';
@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImplementation implements CategoryRemoteDataSource {
  ApiServices apiServices;

  CategoryRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<CategoryOrBrandResponse> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

}