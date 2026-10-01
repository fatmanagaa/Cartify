import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes_manager/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../domain/entities/response/comman/category_brand.dart';

class CustomBrandWidget extends StatelessWidget {
  final CategoryBrand brand;

  const CustomBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.productsScreenRouteName),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: brand.image ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
