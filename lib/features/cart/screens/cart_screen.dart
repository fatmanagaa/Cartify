import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/values_manager.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartScreenViewModel viewModel = getIt<CartScreenViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getItemsInCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartScreenViewModel, CartStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is GetCartLoadingState && viewModel.cartResponse == null) {
            return const MainLoadingWidget();
          } else if (state is GetCartErrorState && viewModel.cartResponse == null) {
            return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: () {
                viewModel.getItemsInCart();
              },
            );
          }

          final products = viewModel.cartResponse?.data?.products ?? [];

          if (products.isEmpty) {
            return Center(
              child: Text(
                'Your cart is empty',
                style: getMediumStyle(
                  fontSize: 18,
                  color: ColorManager.textColor,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final item = products[index];
                      return CartItemWidget(
                        imagePath: item.product?.imageCover ??
                            ImageAssets.categoryCardImage,
                        title: item.product?.title ?? 'Product',
                        price: item.price ?? 0,
                        quantity: item.count ?? 1,
                        onDeleteTap: () {},
                        onDecrementTap: (value) {},
                        onIncrementTap: (value) {},
                        size: 40,
                        color: Colors.black,
                        colorName: 'Black',
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: products.length,
                  ),
                ),
                TotalPriceAndCheckoutBotton(
                  totalPrice:
                      viewModel.cartResponse?.data?.totalCartPrice ?? 0,
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
