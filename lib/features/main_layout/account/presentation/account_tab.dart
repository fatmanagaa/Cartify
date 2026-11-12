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
import 'cubit/account_states.dart';
import 'cubit/account_view_model.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  AccountTabState createState() => AccountTabState();
}

class AccountTabState extends State<AccountTab> {
  final AccountViewModel _viewModel = getIt<AccountViewModel>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _mobileController;
  late final TextEditingController _addressController;

  bool _isFullNameReadOnly = true;
  bool _isEmailReadOnly = true;
  bool _isMobileReadOnly = true;
  bool _isAddressReadOnly = true;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController(text: '************');
    _mobileController = TextEditingController();
    _addressController = TextEditingController();

    _viewModel.loadAccountData();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showChangePasswordDialog(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 20.w,
            right: 20.w,
            bottom: MediaQuery.of(modalContext).viewInsets.bottom + 20.h,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Password',
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    controller: currentPasswordController,
                    label: 'Current Password',
                    hint: 'Enter current password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    backgroundColor: ColorManager.white,
                    validation: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 12.h),
                  BuildTextField(
                    controller: newPasswordController,
                    label: 'New Password',
                    hint: 'Enter new password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    backgroundColor: ColorManager.white,
                    validation: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 12.h),
                  BuildTextField(
                    controller: confirmPasswordController,
                    label: 'Confirm New Password',
                    hint: 'Re-enter new password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .5),
                    backgroundColor: ColorManager.white,
                    validation: (val) {
                      if (val != newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return AppValidators.validatePassword(val);
                    },
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          Navigator.pop(modalContext);
                          _viewModel.changePassword(
                            currentPassword: currentPasswordController.text,
                            password: newPasswordController.text,
                            rePassword: confirmPasswordController.text,
                          );
                        }
                      },
                      child: Text(
                        'Update Password',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _saveProfileChanges() {
    _viewModel.updateUserData(
      name: _fullNameController.text,
      email: _emailController.text,
      phone: _mobileController.text,
    );
    if (_addressController.text.isNotEmpty) {
      _viewModel.addAddress(
        details: _addressController.text,
        phone: _mobileController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountViewModel>.value(
      value: _viewModel,
      child: BlocListener<AccountViewModel, AccountStates>(
        listener: (context, state) {
          if (state is AccountLogoutLoadingState) {
            DialogUtils.showLoading(context, message: 'Logging out...');
          } else if (state is AccountLogoutSuccessState) {
            DialogUtils.hideLoading(context);
            context.goNamed(Routes.signInRouteName);
          } else if (state is AccountLogoutErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.errorMessage,
              posActionName: 'Ok',
            );
          } else if (state is UpdateUserDataLoadingState) {
            DialogUtils.showLoading(context, message: 'Updating profile...');
          } else if (state is UpdateUserDataSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.message,
              posActionName: 'Ok',
            );
            if (state.updatedUser != null) {
              if (state.updatedUser!.name != null && state.updatedUser!.name!.isNotEmpty) {
                _fullNameController.text = state.updatedUser!.name!;
              }
              if (state.updatedUser!.email != null && state.updatedUser!.email!.isNotEmpty) {
                _emailController.text = state.updatedUser!.email!;
              }
              if (state.updatedUser!.phone != null && state.updatedUser!.phone!.isNotEmpty) {
                _mobileController.text = state.updatedUser!.phone!;
              }
            }
          } else if (state is UpdateUserDataErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.errorMessage,
              posActionName: 'Ok',
            );
          } else if (state is ChangePasswordLoadingState) {
            DialogUtils.showLoading(context, message: 'Changing password...');
          } else if (state is ChangePasswordSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.message,
              posActionName: 'Ok',
            );
          } else if (state is ChangePasswordErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context,
              message: state.errorMessage,
              posActionName: 'Ok',
            );
          } else if (state is AccountLoadedState) {
            if (state.user != null) {
              if (state.user!.name != null && state.user!.name!.isNotEmpty) {
                _fullNameController.text = state.user!.name!;
              }
              if (state.user!.email != null && state.user!.email!.isNotEmpty) {
                _emailController.text = state.user!.email!;
              }
              if (state.user!.phone != null && state.user!.phone!.isNotEmpty) {
                _mobileController.text = state.user!.phone!;
              }
            }
            if (state.addresses != null && state.addresses!.isNotEmpty) {
              _addressController.text =
                  state.addresses!.first.details ?? _addressController.text;
            }
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w, vertical: AppPadding.p12.h),
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
                        height: 28.h,
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
                  SizedBox(height: 12.h),
                  BlocBuilder<AccountViewModel, AccountStates>(
                    builder: (context, state) {
                      final name = _viewModel.currentUser?.name ??
                          (_fullNameController.text.isNotEmpty
                              ? _fullNameController.text
                              : 'User');
                      final email = _viewModel.currentUser?.email ??
                          _emailController.text;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $name',
                            style: getSemiBoldStyle(
                              color: ColorManager.darkBlue,
                              fontSize: FontSize.s18.sp,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            email,
                            style: getRegularStyle(
                              color: ColorManager.darkBlue.withValues(alpha: .6),
                              fontSize: FontSize.s14.sp,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(15.r),
                    readOnly: _isFullNameReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your full name',
                    label: 'Your full name',
                    controller: _fullNameController,
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s18.sp),
                    textStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s16.sp),
                    suffixIcon: IconButton(
                      icon: _isFullNameReadOnly
                          ? SvgPicture.asset(SvgAssets.edit)
                          : Icon(Icons.check_circle, color: ColorManager.primary),
                      onPressed: () {
                        setState(() {
                          if (!_isFullNameReadOnly) {
                            _viewModel.updateUserData(
                              name: _fullNameController.text,
                            );
                          }
                          _isFullNameReadOnly = !_isFullNameReadOnly;
                        });
                      },
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(height: 14.h),
                  BuildTextField(
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(15.r),
                    readOnly: _isEmailReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your email address',
                    label: 'Your E-mail',
                    controller: _emailController,
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s18.sp),
                    textStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s16.sp),
                    suffixIcon: IconButton(
                      icon: _isEmailReadOnly
                          ? SvgPicture.asset(SvgAssets.edit)
                          : Icon(Icons.check_circle, color: ColorManager.primary),
                      onPressed: () {
                        setState(() {
                          if (!_isEmailReadOnly) {
                            _viewModel.updateUserData(
                              email: _emailController.text,
                            );
                          }
                          _isEmailReadOnly = !_isEmailReadOnly;
                        });
                      },
                    ),
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                  ),
                  SizedBox(height: 14.h),
                  BuildTextField(
                    controller: _passwordController,
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(15.r),
                    readOnly: true,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your password',
                    label: 'Your password',
                    isObscured: true,
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s18.sp),
                    textStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s16.sp),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(SvgAssets.edit),
                      onPressed: () {
                        _showChangePasswordDialog(context);
                      },
                    ),
                    textInputType: TextInputType.text,
                    validation: AppValidators.validatePassword,
                  ),
                  SizedBox(height: 14.h),
                  BuildTextField(
                    controller: _mobileController,
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(15.r),
                    readOnly: _isMobileReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your mobile no.',
                    label: 'Your mobile number',
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s18.sp),
                    textStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s16.sp),
                    suffixIcon: IconButton(
                      icon: _isMobileReadOnly
                          ? SvgPicture.asset(SvgAssets.edit)
                          : Icon(Icons.check_circle, color: ColorManager.primary),
                      onPressed: () {
                        setState(() {
                          if (!_isMobileReadOnly) {
                            _viewModel.updateUserData(
                              phone: _mobileController.text,
                            );
                          }
                          _isMobileReadOnly = !_isMobileReadOnly;
                        });
                      },
                    ),
                    textInputType: TextInputType.phone,
                    validation: AppValidators.validatePhoneNumber,
                  ),
                  SizedBox(height: 14.h),
                  BuildTextField(
                    controller: _addressController,
                    borderBackgroundColor:
                        ColorManager.primary.withValues(alpha: .4),
                    borderRadius: BorderRadius.circular(15.r),
                    readOnly: _isAddressReadOnly,
                    backgroundColor: ColorManager.white,
                    hint: 'Enter your address',
                    label: 'Your Address',
                    labelTextStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s18.sp),
                    textStyle: getMediumStyle(
                        color: ColorManager.darkBlue, fontSize: FontSize.s16.sp),
                    suffixIcon: IconButton(
                      icon: _isAddressReadOnly
                          ? SvgPicture.asset(SvgAssets.edit)
                          : Icon(Icons.check_circle, color: ColorManager.primary),
                      onPressed: () {
                        setState(() {
                          if (!_isAddressReadOnly) {
                            _viewModel.addAddress(
                              details: _addressController.text,
                              phone: _mobileController.text,
                            );
                          }
                          _isAddressReadOnly = !_isAddressReadOnly;
                        });
                      },
                    ),
                    textInputType: TextInputType.streetAddress,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      onPressed: _saveProfileChanges,
                      child: Text(
                        'Update Profile',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
