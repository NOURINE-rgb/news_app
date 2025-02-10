import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: _appBarTheme(),
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
