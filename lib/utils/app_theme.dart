import 'package:flutter/material.dart';
import 'package:news_applicaiton/utils/app_colors.dart';
import 'package:news_applicaiton/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor
    ),
    iconTheme: IconThemeData(
      color: AppColors.blackColor
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: TextTheme(
        labelLarge: AppStyles.bold16Black,
        labelMedium: AppStyles.medium14Black,
        headlineLarge: AppStyles.medium20Black,
        bodyLarge: AppStyles.medium24Black,
        bodyMedium: AppStyles.bold20White,
        bodySmall: AppStyles.medium20Black
      ),
    indicatorColor: AppColors.blackColor,
  );


  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor
      ),
      iconTheme: IconThemeData(
          color: AppColors.whiteColor
      ),
    scaffoldBackgroundColor: AppColors.blackColor,
      textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        headlineLarge: AppStyles.medium20White,
        bodyLarge: AppStyles.medium24White,
        bodyMedium: AppStyles.bold20Black,
          bodySmall: AppStyles.medium20White
      ),
    indicatorColor: AppColors.whiteColor
  );
}