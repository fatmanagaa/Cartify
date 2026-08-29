import 'package:ecommerce_app/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_app/features/main_layout/main_layout.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login/sign_in_screen.dart';
import '../../features/auth/resgister/sign_up_screen.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.signInRoute,
    routes: [
      GoRoute(
        name: Routes.signInRouteName,
        path: Routes.signInRoute,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        name: Routes.signUpRouteName,
        path: Routes.signUpRoute,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: Routes.mainRouteName,
        path: Routes.mainRoute,
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        name: Routes.cartRouteName,
        path: Routes.cartRoute,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        name: Routes.productsScreenRouteName,
        path: Routes.productsScreenRoute,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        name: Routes.productDetailsRouteName,
        path: Routes.productDetails,
        builder: (context, state) {
          final product = state.extra is Map<String, dynamic>
              ? state.extra as Map<String, dynamic>
              : null;
          return ProductDetails(product: product);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('No Route Found')),
      body: const Center(child: Text('No Route Found')),
    ),
  );
}
