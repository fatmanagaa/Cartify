import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:ecommerce_app/domain/entities/response/product/product.dart';
import 'package:ecommerce_app/features/main_layout/wishlist/presentation/widgets/custom_txt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemDetails extends StatelessWidget {
  const WishlistItemDetails({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final categoryName = product.category?.name ?? product.brand?.name ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product.title ?? '',
          maxLines: 1,
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: AppSize.s16.sp,
          ),
        ),
        if (categoryName.isNotEmpty)
          CustomTextWgt(
            data: categoryName,
            maxLines: 1,
            textStyle: getMediumStyle(
              color: ColorManager.appBarTitleColor.withValues(alpha: 0.7),
              fontSize: 13.sp,
            ),
          ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${product.price ?? 0}  ',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: AppSize.s16.sp,
              ).copyWith(letterSpacing: 0.17),
            ),
            if (product.ratingsAverage != null) ...[
              const Spacer(),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: AppSize.s16.sp,
              ),
              SizedBox(width: AppSize.s4.w),
              CustomTextWgt(
                data: '${product.ratingsAverage}',
                textStyle: getMediumStyle(
                  color: ColorManager.primaryDark,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(width: AppSize.s8.w),
            ],
          ],
        ),
      ],
    );
  }
}
