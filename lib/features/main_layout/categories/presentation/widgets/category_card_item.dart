import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/font_manager.dart';
import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;

  const CategoryCardItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSize.s16),
      height: AppSize.s100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s12),
        child: Stack(
          children: [
            image.startsWith('http')
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      ImageAssets.categoryCardImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p18, vertical: AppMargin.m8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title,
                            style: getBoldStyle(
                                color: ColorManager.textColor,
                                fontSize: FontSize.s16.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 110.w,
                            height: 35.h,
                            child: ElevatedButton(
                              onPressed: () => navigation(),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(120.w, 30.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 0),
                                  backgroundColor: ColorManager.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              child: Text(
                                "Shop Now",
                                style:
                                    getRegularStyle(color: ColorManager.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
