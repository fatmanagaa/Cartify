import 'package:injectable/injectable.dart';

import '../entities/response/product/sub_category.dart';
import '../repository/sub_category/sub_category_repository.dart';

@injectable
class GetAllSubCategories {
  final SubCategoryRepository subCategoryRepository;

  GetAllSubCategories({required this.subCategoryRepository});

  Future<List<SubCategory>> invoke(String categoryId) async {
    return await subCategoryRepository.getSubCategories(categoryId);
  }
}
