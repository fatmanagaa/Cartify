import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: AppStyles.medium20Black,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.bold30Black,
      headlineLarge: AppStyles.medium24Black,
      titleLarge: AppStyles.medium20Black,
      titleMedium: AppStyles.bold16Black,
      bodyLarge: AppStyles.medium14Black,
      bodyMedium: AppStyles.medium12Grey,
    ),
  );
}
