import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppStyles.medium20Black,
      iconTheme: IconThemeData(color: ColorManager.primary),
    ),
    textTheme: TextTheme(
      displayLarge: AppStyles.bold30Black,
      headlineLarge: AppStyles.medium24Black,
      titleLarge: AppStyles.medium20Black,
      titleMedium: AppStyles.bold16Black,
      bodyLarge: AppStyles.medium14Black,
      bodyMedium: AppStyles.medium12Grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        textStyle: AppStyles.bold16White,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}
