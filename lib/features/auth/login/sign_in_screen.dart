import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widget/dialog_utils.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/auth_states.dart';
import 'package:ecommerce_app/features/auth/login/cubit/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/app_styles.dart';

class SignInScreen extends StatelessWidget {
  final LoginViewModel signInViewModel = getIt<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _emailController =
      TextEditingController(text: "adasdfvv@fds.com");
  final _passwordController = TextEditingController(text: "18061717@A");

  SignInScreen({super.key});

  void login() {
    if (_formKey.currentState!.validate()) {
      signInViewModel.login(
          email: _emailController.text, password: _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: signInViewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context, message: 'Loading...');
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              message: state.errorMessage.message, posActionName: 'Ok');
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              message: 'Login Success',
              posActionName: 'Ok', posAction: () {
            context.goNamed(Routes.mainRouteName);
          });
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(ImageAssets.logo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Text(
                      'Welcome Back To Route',
                      style: getBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: getLightStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    BuildTextField(
                      controller: _emailController,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your name',
                      label: 'User name',
                      textInputType: TextInputType.emailAddress,
                      validation: AppValidators.validateEmail,
                    ),
                    SizedBox(
                      height: AppSize.s28.h,
                    ),
                    BuildTextField(
                      controller: _passwordController,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'Password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s8.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password?',
                              style: getMediumStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s18.sp),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s60.h,
                    ),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .8,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          isStadiumBorder: false,
                          label: 'Login',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s18),
                          onTap: () {
                            login();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(
                          width: AppSize.s8.w,
                        ),
                        GestureDetector(
                          onTap: () => context.goNamed(Routes.signUpRouteName),
                          child: Text(
                            'Create Account',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
