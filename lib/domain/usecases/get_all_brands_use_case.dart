import 'package:ecommerce_app/domain/entities/response/category_brand/category_or_brand_response.dart';
import 'package:ecommerce_app/domain/repository/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase {
  final BrandRepository brandRepository;

  GetAllBrandsUseCase(this.brandRepository);

  Future<CategoryOrBrandResponse?> invoke() async {
    return await brandRepository.getBrands();
  }
}
