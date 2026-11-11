import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/cubit/wishlist_view_model.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistViewModel viewModel = getIt<WishlistViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getWishlist(showLoading: viewModel.wishlistProducts.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistViewModel, WishlistStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is DeleteFromWishlistSuccessState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: ColorManager.primary,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (state is AddToWishlistSuccessState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        } else if (state is DeleteFromWishlistErrorState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is WishlistLoadingState &&
            viewModel.wishlistProducts.isEmpty) {
          return const Center(child: MainLoadingWidget());
        }

        if (state is WishlistErrorState && viewModel.wishlistProducts.isEmpty) {
          return Center(
            child: MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: () => viewModel.getWishlist(),
            ),
          );
        }

        if (viewModel.wishlistProducts.isEmpty) {
          return RefreshIndicator(
            color: ColorManager.primary,
            onRefresh: () => viewModel.getWishlist(),
            child: ListView(
              children: [
                SizedBox(height: 150.h),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 80.sp,
                        color: ColorManager.primary.withValues(alpha: 0.5),
                      ),
                      SizedBox(height: AppSize.s16.h),
                      Text(
                        'Your wishlist is empty',
                        style: getSemiBoldStyle(
                          color: ColorManager.primaryDark,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                      SizedBox(height: AppSize.s8.h),
                      Text(
                        'Explore more and add products you love!',
                        style: getRegularStyle(
                          color: ColorManager.appBarTitleColor.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: AppSize.s14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          color: ColorManager.primary,
          onRefresh: () => viewModel.getWishlist(),
          child: Padding(
            padding: EdgeInsets.only(
              left: AppSize.s14.w,
              right: AppSize.s14.w,
              top: AppSize.s10.h,
              bottom: MediaQuery.of(context).padding.bottom + 60.h,
            ),
            child: ListView.builder(
              itemCount: viewModel.wishlistProducts.length,
              itemBuilder: (context, index) {
                final product = viewModel.wishlistProducts[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: WishlistItem(
                    product: product,
                    onRemove: () {
                      if (product.id != null) {
                        viewModel.deleteFromWishlist(product.id!);
                      }
                    },
                    onAddToCart: () {
                      if (product.id != null) {
                        getIt<CartScreenViewModel>().addProductToCart(
                          product.id!,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Product added to cart'),
                            backgroundColor: ColorManager.primary,
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
