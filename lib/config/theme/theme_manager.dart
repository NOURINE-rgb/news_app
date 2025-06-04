import 'package:clean_news_app/config/theme/app_colors.dart';

import 'package:flutter/material.dart';



ThemeData getAppTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.blueColor,
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.lightBlue,
    disabledColor: AppColors.greyColor,
    cardColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.blueColor),
      elevation: 2,
      titleTextStyle: const TextStyle(
        color: AppColors.darkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
    
      headline1: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.darkColor),
      headline2: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.darkColor),
      subtitle1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.greyColor),
      bodyText1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.darkColor),
      caption: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.greyColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBlue,
      hintStyle: const TextStyle(color: AppColors.greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.greyColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}


// class AppTheme {
//   static ThemeData lightTheme() {
//     return ThemeData().copyWith(
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: AppColors.white,
//       elevatedButtonTheme: _elevatedButton(),
//     );
//   }

//   static ThemeData darkTheme() {
//     return ThemeData().copyWith(
//       brightness: Brightness.dark,
//       elevatedButtonTheme: _elevatedButton(),
//       appBarTheme: _appBarTheme(),
//     );
//   }
// }

// ElevatedButtonThemeData _elevatedButton() {
//   return ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.blueColor,
//       elevation: 0,
//       foregroundColor: AppColors.white,
//       iconColor: AppColors.white,
//       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//     ),
//   );
// }

// AppBarTheme _appBarTheme() {
//   return AppBarTheme(
//     color: Colors.white,
//     elevation: 0,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
//     titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
//   );
// }
