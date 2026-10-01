import 'dart:async';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 7), () {
      if (mounted) {
        context.goNamed(Routes.signInRouteName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(
          ImageAssets.logo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
