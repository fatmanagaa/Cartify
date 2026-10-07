import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/di.dart';
import '../../../../core/routes_manager/app_routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widget/dialog_utils.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import 'cubit/profile_states.dart';
import 'cubit/profile_view_model.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  final ProfileViewModel _viewModel = getIt<ProfileViewModel>();

  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => _viewModel,
      child: BlocListener<ProfileViewModel, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileLogoutLoadingState) {
            DialogUtils.showLoading(context, message: 'Logging out...');
          } else if (state is ProfileLogoutSuccessState) {
            DialogUtils.hideLoading(context);
            context.goNamed(Routes.signInRouteName);
          } else if (state is ProfileLogoutErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.errorMessage,
              posActionName: 'Ok',
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        SvgAssets.routeLogo,
                        height: AppSize.s40,
                        colorFilter: ColorFilter.mode(
                          ColorManager.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _viewModel.logout();
                        },
                        icon: Icon(
                          Icons.logout,
                          color: ColorManager.primary,
                          size: AppSize.s24,
                        ),
                        tooltip: 'Logout',
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s20.h),
                  Text(
                    'Welcome, Mohamed',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  Text(
                    'mohamed.N@gmail.com',
                    style: getRegularStyle(
                        color: ColorManager.primary.withValues(alpha: .5),
                        fontSize: FontSize.s14),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    readOnly: isFullNameReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your full name',
                    label: 'Full Name',
                    controller:
                        TextEditingController(text: 'Mohamed Mohamed Nabil'),
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        setState(() {
                          isFullNameReadOnly = false;
                        });
                      },
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validateFullName,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    readOnly: isEmailReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your email address',
                    label: 'E-mail address',
                    controller:
                        TextEditingController(text: 'mohamed.N@gmail.com'),
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        setState(() {
                          isEmailReadOnly = false;
                        });
                      },
                    ),
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    onTap: () {
                      setState(() {
                        isPasswordReadOnly = false;
                      });
                    },
                    controller:
                        TextEditingController(text: '123456789123456'),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    readOnly: isPasswordReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your password',
                    label: 'Password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        setState(() {
                          isPasswordReadOnly = false;
                        });
                      },
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validatePassword,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: TextEditingController(text: '01122118855'),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    readOnly: isMobileNumberReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your mobile no.',
                    label: 'Your mobile number',
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        setState(() {
                          isMobileNumberReadOnly = false;
                        });
                      },
                    ),
                    textInputType: TextInputType.phone,
                    validation: AppValidators.validatePhoneNumber,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: TextEditingController(
                        text: '6th October, street 11.....'),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    readOnly: isAddressReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: '6th October, street 11.....',
                    label: 'Your Address',
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        setState(() {
                          isAddressReadOnly = false;
                        });
                      },
                    ),
                    textInputType: TextInputType.streetAddress,
                    validation: AppValidators.validateFullName,
                    hintTextStyle: getRegularStyle(color: ColorManager.primary)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: AppSize.s24.h),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _viewModel.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p28.w,
                          vertical: AppPadding.p12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                        ),
                      ),
                      icon: Icon(
                        Icons.logout,
                        color: ColorManager.white,
                        size: AppSize.s20,
                      ),
                      label: Text(
                        'Log Out',
                        style: getMediumStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
