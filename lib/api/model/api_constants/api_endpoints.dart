class ApiEndpoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';
  static const String loginEndpoint = 'auth/signin';
  static const String registerEndpoint = 'auth/signup';
  static const String categoriesEndpoint = 'categories';
  static const String brandsEndpoint = 'brands';
  static const String productsEndpoint = 'products';
  static const String cartEndpoint = 'cart';
  static const String deleteCartApi = 'cart/{productId}';
  static const String subCategoriesOnCategory =
      'categories/{categoryId}/subcategories';
  static const String wishlist = 'wishlist';
  static const String removeFromWishlist = 'wishlist/{productId}';
}
