import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_error_widget.dart';
import 'package:ecommerce_app/core/widget/main_loading_widget.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/features/product_details/cubit/product_details_states.dart';
import 'package:ecommerce_app/features/product_details/cubit/product_details_view_model.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    this.product,
    this.productId,
  });

  final Product? product;
  final String? productId;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late final ProductDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<ProductDetailsViewModel>();
    if (widget.product != null) {
      viewModel.initProduct(widget.product);
    } else if (widget.productId != null) {
      viewModel.getProductDetails(widget.productId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icSearch),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () => context.pushNamed(Routes.cartRouteName),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailsViewModel, ProductDetailsStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is ProductDetailsErrorState && viewModel.product == null) {
            return MainErrorWidget(
              errorMessage: state.errorMessage,
              onPressed: () {
                if (widget.productId != null) {
                  viewModel.getProductDetails(widget.productId!);
                } else if (widget.product?.id != null) {
                  viewModel.getProductDetails(widget.product!.id!);
                }
              },
            );
          } else if (state is ProductDetailsLoadingState && viewModel.product == null) {
            return const MainLoadingWidget();
          }

          final product = viewModel.product ?? widget.product;

          if (product == null) {
            return const Center(
              child: Text('No product details available'),
            );
          }

          List<Widget> sliderItems = [];
          if (product.images != null && product.images!.isNotEmpty) {
            sliderItems = product.images!
                .map((imageUrl) => ProductItem(imageUrl: imageUrl))
                .toList();
          } else if (product.imageCover != null && product.imageCover!.isNotEmpty) {
            sliderItems = [ProductItem(imageUrl: product.imageCover!)];
          } else {
            sliderItems = [
              const ProductItem(
                imageUrl:
                    'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
              )
            ];
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductSlider(
                    items: sliderItems,
                    initialIndex: 0,
                  ),
                  SizedBox(height: 24.h),
                  ProductLabel(
                    productName: product.title ?? '',
                    productPrice: 'EGP ${product.price ?? 0}',
                  ),
                  SizedBox(height: 16.h),
                  ProductRating(
                    productBuyers: '${product.sold ?? 0}',
                    productRating:
                        '${product.ratingsAverage ?? 0.0} (${product.ratingsQuantity ?? 0})',
                  ),
                  SizedBox(height: 16.h),
                  ProductDescription(
                    productDescription: product.description ?? '',
                  ),
                  ProductSize(
                    size: const [35, 38, 39, 40],
                    onSelected: () {},
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Color',
                    style: getMediumStyle(color: ColorManager.appBarTitleColor)
                        .copyWith(fontSize: 18.sp),
                  ),
                  ProductColor(
                    color: const [
                      Colors.red,
                      Colors.blueAccent,
                      Colors.green,
                      Colors.yellow,
                    ],
                    onSelected: () {},
                  ),
                  SizedBox(height: 48.h),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total price',
                            style: getMediumStyle(
                              color: ColorManager.primary.withValues(alpha: .6),
                            ).copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'EGP ${product.price ?? 0}',
                            style: getMediumStyle(
                              color: ColorManager.appBarTitleColor,
                            ).copyWith(fontSize: 18.sp),
                          )
                        ],
                      ),
                      SizedBox(width: 33.w),
                      Expanded(
                        child: CustomElevatedButton(
                          label: 'Add to cart',
                          onTap: () => context.pushNamed(Routes.cartRouteName),
                          prefixIcon: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: ColorManager.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
