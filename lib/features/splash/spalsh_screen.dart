import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/features/splash/cubit/splash_states.dart';
import 'package:ecommerce_app/features/splash/cubit/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashViewModel _viewModel = getIt<SplashViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.checkAutoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashViewModel>(
      create: (context) => _viewModel,
      child: BlocListener<SplashViewModel, SplashStates>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            context.goNamed(Routes.mainRouteName);
          } else if (state is UnAuthenticatedState) {
            context.goNamed(Routes.signInRouteName);
          }
        },
        child: Scaffold(
          backgroundColor: ColorManager.primary,
          body: Center(
            child: Image.asset(
              ImageAssets.logo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
