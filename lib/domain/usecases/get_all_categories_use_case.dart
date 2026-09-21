import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:ecommerce_app/domain/repository/category/category_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllCategoriesUseCase {
  final CategoryRepository categoryRepository;

  GetAllCategoriesUseCase(this.categoryRepository);

  Future<CategoryOrBrandResponse?> invoke() async {
    return await categoryRepository.getCategories();
  }
}
