import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
          {Object? arguments, required RoutePredicate predicate}) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, predicate,
          arguments: arguments);

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension AppColorsExtension on ColorManager {
  static ColorScheme get lightColorScheme => const ColorScheme.light(
        primary: ColorManager.primary,
        secondary: ColorManager.primaryLight,
        surface: ColorManager.backgroundLight,
        background: ColorManager.backgroundLight,
        error: ColorManager.error,
        onPrimary: ColorManager.textOnPrimary,
        onSecondary: ColorManager.textPrimary,
        onSurface: ColorManager.textPrimary,
        onBackground: ColorManager.textPrimary,
        onError: ColorManager.white,
      );
}