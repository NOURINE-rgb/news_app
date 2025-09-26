import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/config/theme/values_manager.dart';
import 'package:clean_news_app/core/constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/styles_manager.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllPressed,
  });
  final String title;
  final VoidCallback? onSeeAllPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: get20BoldStyle(color: AppColors.textPrimary),
          ),
          if (onSeeAllPressed != null)
            TextButton(
              onPressed: onSeeAllPressed,
              child: Text(
                StringsManager.seeAll,
                style: get16MediumStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
