import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/constants_manager.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/widgets/wishlist_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
    required this.product,
    this.onRemove,
    this.onAddToCart,
  });

  final Product product;
  final VoidCallback? onRemove;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.productDetailsRouteName,
          extra: product,
        );
      },
      child: Container(
        height: AppSize.s135.h,
        padding: EdgeInsets.only(right: AppSize.s8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16.r),
          border: Border.all(color: ColorManager.primary.withValues(alpha: .3)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                border: Border.all(
                  color: ColorManager.primary.withValues(alpha: .6),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s16.r),
                child: CachedNetworkImage(
                  width: AppSize.s120.w,
                  height: AppSize.s135.h,
                  fit: BoxFit.cover,
                  imageUrl: product.imageCover ?? '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorManager.primary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: AppSize.s8.w),
                child: WishlistItemDetails(
                  product: product,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HeartButton(
                  isFavorite: true,
                  onTap: onRemove,
                ),
                SizedBox(height: AppSize.s14.h),
                AddToCartButton(
                  onPressed: onAddToCart,
                  text: AppConstants.addToCart,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

