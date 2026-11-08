import 'package:ecommerce_app/api/retrofit/api_services.dart';
import 'package:ecommerce_app/domain/entities/response/product/sub_category.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_source/remote/sub_category/sub_category_remote_data_source.dart';
import '../../../mapper/product/sub_category_mapper.dart';

@Injectable(as: SubCategoryRemoteDataSource)
class SubCategoryRemoteDataSourceImplementation
    implements SubCategoryRemoteDataSource {
  final ApiServices apiServices;

  SubCategoryRemoteDataSourceImplementation(this.apiServices);

  @override
  Future<List<SubCategory>> getSubCategories(String categoryId) async {
    var response = await apiServices.getSubCategories(categoryId);
    return response.toSubCategoryList();
  }
}
