import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle textStyle({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    required Color color,
  }) =>
      GoogleFonts.commissioner(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
  static TextTheme lightTextTheme =
      GoogleFonts.commissionerTextTheme().copyWith(
    bodyLarge: GoogleFonts.commissioner(),
  );
}
