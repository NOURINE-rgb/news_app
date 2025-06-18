import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/font_manager.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData getAppTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: AppColorsExtension.lightColorScheme,

      visualDensity: VisualDensity.adaptivePlatformDensity,

      scaffoldBackgroundColor: ColorManager.backgroundLight,

      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.primaryLight,
        foregroundColor: ColorManager.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: ColorManager.lightGrey,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleTextStyle: getSemiBoldStyle(
          fontSize: FontSize.s22,
          color: ColorManager.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: ColorManager.textPrimary,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      textTheme: TextTheme(
        // Onboarding & Article Titles
        headlineSmall: getSemiBoldStyle(
          fontSize: FontSize.s24,
          color: ColorManager.textPrimary,
        ).copyWith(height: 1.3),

        // Article Cards & Sections
        titleLarge: getSemiBoldStyle(
          fontSize: FontSize.s20,
          color: ColorManager.textPrimary,
        ).copyWith(height: 1.4),

        // Body Paragraphs
        bodyLarge: getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.textSecondary,
        ).copyWith(height: 1.5),

        // Subheadings, Tags, etc.
        bodyMedium: getRegularStyle(
          fontSize: FontSize.s14,
          color: ColorManager.textPrimary,
        ).copyWith(height: 1.5),

        bodySmall: getRegularStyle(
          fontSize: FontSize.s12,
          color: ColorManager.textSecondary,
        ).copyWith(height: 1.4),

        // Buttons and Utility Labels
        labelLarge: getMediumStyle(
          fontSize: FontSize.s14,
          color: ColorManager.textPrimary,
        ),

        labelMedium: getMediumStyle(
          fontSize: FontSize.s12,
          color: ColorManager.textSecondary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: ColorManager.cardBackground,
        elevation: 2,
        shadowColor: ColorManager.lightGrey,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.textOnPrimary,
          elevation: 2,
          shadowColor: ColorManager.mediumGrey,
          surfaceTintColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: getSemiBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textOnPrimary,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: getSemiBoldStyle(
            fontSize: FontSize.s14,
            color: ColorManager.primary,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorManager.primary,
          side: const BorderSide(color: ColorManager.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: getSemiBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.primary,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorManager.lightGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.textHint,
        ),
        labelStyle: getRegularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.textSecondary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorManager.error, width: 2),
        ),
      ),

      iconTheme: const IconThemeData(
        color: ColorManager.textSecondary,
        size: 24,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.textOnPrimary,
        elevation: AppSize.s4,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: ColorManager.lightGrey,
        selectedColor: ColorManager.primaryLight,
        disabledColor: ColorManager.lightGrey,
        labelStyle: getRegularStyle(
          fontSize: FontSize.s14,
          color: ColorManager.textPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: ColorManager.lightGrey,
        thickness: 1,
        space: 1,
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        titleTextStyle: getMediumStyle(
          fontSize: FontSize.s16,
          color: ColorManager.textPrimary,
        ),
        subtitleTextStyle: getRegularStyle(
          fontSize: FontSize.s14,
          color: ColorManager.textSecondary,
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorManager.primary,
        linearTrackColor: ColorManager.lightGrey,
        circularTrackColor: ColorManager.lightGrey,
      ),

      // Snack Bar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorManager.dark,
        contentTextStyle: getRegularStyle(
          fontSize: FontSize.s14,
          color: ColorManager.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Dialog Theme
      // dialogTheme: DialogTheme(
      //   backgroundColor: AppColors.white,
      //   elevation: 8,
      //   shadowColor: AppColors.shadowMedium,
      //   surfaceTintColor: Colors.transparent,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16),
      //   ),
      //   titleTextStyle: getSemiBoldStyle(
      //     fontSize: FontSize.s20,
      //     color: AppColors.textPrimary,
      //   ),
      //   contentTextStyle: getRegularStyle(
      //     fontSize: FontSize.s16,
      //     color: AppColors.textPrimary,
      //   ),
      // ),

      // Bottom Sheet Theme
      // bottomSheetTheme: const BottomSheetThemeData(
      //   backgroundColor: AppColors.white,
      //   elevation: 8,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top: Radius.circular(20),
      //     ),
      //   ),
      // ),
    );
