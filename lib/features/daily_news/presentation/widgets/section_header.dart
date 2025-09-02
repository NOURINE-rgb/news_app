import 'package:clean_news_app/config/theme/color_manager.dart';
import 'package:clean_news_app/config/theme/font_manager.dart';
import 'package:clean_news_app/core/constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:clean_news_app/config/theme/styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllPressed,
  });
  final String title;
  final VoidCallback onSeeAllPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getBoldStyle(
                color: ColorManager.dark, fontSize: FontSize.s24.sp),
          ),
          TextButton(
            onPressed: onSeeAllPressed,
            child: Text(
              StringsManager.seeAll,
              style: TextStyle(
                color: ColorManager.primary,
                fontWeight: FontManager.medium,
                fontSize: FontSize.s16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
