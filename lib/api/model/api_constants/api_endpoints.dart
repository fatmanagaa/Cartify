// lib/core/api/api_endpoints.dart

class ApiEndpoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1/';

  // ---------- Auth ----------
  static const String loginEndpoint = 'auth/signin';
  static const String registerEndpoint = 'auth/signup';

  // ---------- Products & Categories ----------
  static const String categoriesEndpoint = 'categories';
  static const String brandsEndpoint = 'brands';
  static const String productsEndpoint = 'products';
  static const String subCategoriesOnCategory =
      'categories/{categoryId}/subcategories';

  // ---------- Cart ----------
  static const String cartEndpoint = 'cart';
  static const String deleteCartApi = 'cart/{productId}';

  // ---------- Wishlist ----------
  static const String wishlist = 'wishlist';
  static const String removeFromWishlist = 'wishlist/{productId}';

  // ---------- Forgot Password
  static const String forgotPassword = 'auth/forgotPasswords';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';

  // ---------- Account ----------
  static const String verifyToken = 'auth/verifyToken';
  static const String getAllUsers = 'users';
  static const String updateMe = 'users/updateMe';
  static const String changeMyPassword = 'users/changeMyPassword';

  // ---------- Addresses ----------
  static const String addresses = 'addresses';
  static const String removeAddress = 'addresses/{addressId}';
}
