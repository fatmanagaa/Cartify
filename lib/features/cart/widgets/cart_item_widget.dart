import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/domain/entities/response/cart/get/get_product.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/values_manager.dart';
import '../../../core/routes_manager/app_routes.dart';
import '../../../core/widget/product_counter.dart';
import 'package:ecommerce_app/features/cart/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartItemWidget extends StatefulWidget {
  final GetProduct items;

  const CartItemWidget({
    super.key,
    required this.items,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.colorName,
    required this.size,
    required this.price,
    required this.onDeleteTap,
    required this.quantity,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });
  final String imagePath;
  final String title;
  final Color color;
  final String colorName;
  final int size;
  final int price;
  final void Function() onDeleteTap;
  final int quantity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => context.pushNamed(Routes.productDetailsRouteName),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(color: ColorManager.primary.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          // display image in the container
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                  color: ColorManager.primary.withValues(alpha: 0.3)),
            ),
            child: widget.imagePath.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: widget.imagePath,
                    fit: BoxFit.cover,
                    height: isPortrait ? height * 0.142 : height * 0.23,
                    width: isPortrait ? width * 0.29 : 165.w,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    height: isPortrait ? height * 0.142 : height * 0.23,
                    width: isPortrait ? width * 0.29 : 165.w,
                  ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: widget.onDeleteTap,
                        child: Image.asset(
                          IconsAssets.icDelete,
                          color: ColorManager.textColor,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),

                  // SizedBox(height: 7.h),
                  const Spacer(),
                  // display color and size===================
                  ColorAndSizeCartItem(
                    color: widget.color,
                    colorName: widget.colorName,
                    size: widget.size,
                  ),
                  const Spacer(),
                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${widget.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                      ProductCounter(
                        add: widget.onIncrementTap,
                        productCounter: widget.quantity,
                        remove: widget.onDecrementTap,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
