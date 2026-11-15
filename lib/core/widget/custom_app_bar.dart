import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../routes_manager/app_routes.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool showSearchAndCart;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.actions,
    this.showSearchAndCart = true,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(
        title,
        style: getMediumStyle(color: ColorManager.appBarTitleColor)
            .copyWith(fontSize: 20.sp),
      ),
      actions: actions ??
          (showSearchAndCart
              ? [
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pushNamed(Routes.cartRouteName),
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icCart),
                      color: ColorManager.primary,
                    ),
                  ),
                ]
              : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
