import 'package:clean_news_app/config/theme/app_colors.dart';
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

  double get sizeWidth => MediaQuery.of(this).size.width;
  double get sizeHeight => MediaQuery.of(this).size.height;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension AppColorsExtension on AppColors {
  static ColorScheme get lightColorScheme => const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.backgroundLight,
        background: AppColors.backgroundLight,
        error: AppColors.error,
        onPrimary: AppColors.textOnPrimary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onError: AppColors.white,
      );
}
