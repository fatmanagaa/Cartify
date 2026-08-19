import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
  );
}

// regular style
TextStyle getRegularStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// light style
TextStyle getLightStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semi bold style
TextStyle getSemiBoldStyle({double fontSize = 12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

class AppStyles {
  static TextStyle medium20White = getMediumStyle(
    fontSize: 20,
    color: AppColors.whiteColor,
  );

  static TextStyle medium20Black = getMediumStyle(
    fontSize: 20,
    color: AppColors.blackColor,
  );

  static TextStyle medium14White = getMediumStyle(
    fontSize: 14,
    color: AppColors.whiteColor,
  );

  static TextStyle bold16White = getBoldStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
  );

  static TextStyle medium14Black = getMediumStyle(
    fontSize: 14,
    color: AppColors.blackColor,
  );

  static TextStyle medium24White = getMediumStyle(
    fontSize: 24,
    color: AppColors.whiteColor,
  );

  static TextStyle medium24Black = getMediumStyle(
    fontSize: 24,
    color: AppColors.blackColor,
  );

  static TextStyle bold16Black = getBoldStyle(
    fontSize: 16,
    color: AppColors.blackColor,
  );

  static TextStyle medium12Grey = getMediumStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );

  static TextStyle bold30Black = getBoldStyle(
    fontSize: 30,
    color: AppColors.blackColor,
  );

  static TextStyle bold30White = getBoldStyle(
    fontSize: 30,
    color: AppColors.whiteColor,
  );
}
