import 'package:ecommerce_app/data/data_source/remote/product/product_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/response/product/product_response.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repository/product/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<ProductResponse?> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }
}
