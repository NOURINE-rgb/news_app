import './app_colors.dart';
import './font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color, {
  TextDecoration decoration = TextDecoration.none,
}) {
  return GoogleFonts.commissioner(
    fontSize: fontSize.r,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

// Regular
TextStyle get14RegularStyle({
  double fontSize = FontSize.s14,
  Color color = AppColors.primary,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.regular,
    color,
    decoration: decoration,
  );
}


// Bold
TextStyle get26BoldStyle({
  double fontSize = FontSize.s26,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.bold,
    color,
    decoration: decoration,
  );
}

TextStyle get20BoldStyle({
  double fontSize = FontSize.s20,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.bold,
    color,
    decoration: decoration,
  );
}

TextStyle get16BoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.bold,
    color,
    decoration: decoration,
  );
}

// SemiBold

TextStyle get22SemiBoldStyle({
  double fontSize = FontSize.s22,
  Color color = AppColors.textPrimary,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.semiBold,
    color,
    decoration: decoration,
  );
}



TextStyle get16SemiBoldStyle({
  double fontSize = FontSize.s16,
  Color color = AppColors.textPrimary,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.semiBold,
    color,
    decoration: decoration,
  );
}

// Medium
TextStyle get18MediumStyle({
  double fontSize = FontSize.s18,
  Color color = AppColors.textPrimary,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.medium,
    color,
    decoration: decoration,
  );
}

TextStyle get16MediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.medium,
    color,
    decoration: decoration,
  );
}

TextStyle get14MediumStyle({
  double fontSize = FontSize.s14,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(
    fontSize,
    FontManager.medium,
    color,
    decoration: decoration,
  );
}
