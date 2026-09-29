import 'package:ecommerce_app/data/data_source/remote/product/product_remote_data_source.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repository/product/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
ProductRemoteDataSource productRemoteDataSource;


ProductRepositoryImpl(this.productRemoteDataSource);

@override
  Future<Product?> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }
  }
