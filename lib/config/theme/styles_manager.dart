import 'package:clean_news_app/config/theme/font_manager.dart';
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
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

// Regular
TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(fontSize, FontManager.regular, color, decoration: decoration);
}

// Bold
TextStyle getBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(fontSize, FontManager.bold, color, decoration: decoration);
}

// SemiBold
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(fontSize, FontManager.semiBold, color, decoration: decoration);
}

// Medium
TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(fontSize, FontManager.medium, color, decoration: decoration);
}

// Light
TextStyle getLightStyle({
  double fontSize = FontSize.s16,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _getTextStyle(fontSize, FontManager.light, color, decoration: decoration);
}
