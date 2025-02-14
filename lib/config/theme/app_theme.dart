import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/app_text_style.dart';
import 'package:clean_news_app/config/theme/sizes.dart';
import 'package:flutter/material.dart';

// nzid primarycolor
/// text theme hna maghadich ndirah
/// chiptheme
/// scaffoldbackgroundcolor
/// appbartheme
/// bottomsheettheme
/// buttons and another widgets
/// inputdecorationtheme
///
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      elevatedButtonTheme: _elevatedButton(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData().copyWith(
      brightness: Brightness.dark,
      elevatedButtonTheme: _elevatedButton(),
    );
  }
}

ElevatedButtonThemeData _elevatedButton() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blueColor,
      elevation: 0,
      foregroundColor: AppColors.primaryColorDark,
      iconColor: AppColors.primaryColorDark,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
  );
}
