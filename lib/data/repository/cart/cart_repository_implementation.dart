import 'package:ecommerce_app/domain/entities/response/cart/get/get_cart_response.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/response/cart/add/add_product_cart_response.dart';
import '../../../domain/repository/cart/cart_repository.dart';
import '../../data_source/remote/cart/cart_remote_data_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<AddProductCartResponse> addProductToCart(String productId) {
    return _cartRemoteDataSource.addProductToCart(productId);
  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    return _cartRemoteDataSource.getItemsInCart();
  }
}
