import '../../../../../core/utils/values_manager.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionNname;
  final Function function;
  const CustomSectionBar(
      {super.key, required this.sectionNname, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionNname,
            style: getMediumStyle(
              color: ColorManager.darkBlue,
              fontSize: 18.sp,
            ),
          ),
          TextButton(
            onPressed: () {
              function();
            },
            child: Text(
              'view all',
              style: getMediumStyle(
                color: ColorManager.darkBlue,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
