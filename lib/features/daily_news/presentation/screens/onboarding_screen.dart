import "package:clean_news_app/config/routes/routes_manager.dart";
import "package:clean_news_app/config/theme/app_colors.dart";
import "package:clean_news_app/config/theme/font_manager.dart";
import "package:clean_news_app/config/theme/values_manager.dart";
import "package:clean_news_app/core/constants/assets_manager.dart";
import "package:clean_news_app/core/constants/strings_manager.dart";
import "package:clean_news_app/core/helpers/extensions.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../../../../config/theme/styles_manager.dart";

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.sizeHeight * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsManager.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              width: double.infinity,
              padding: EdgeInsets.all(AppPadding.p14.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSize.s24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    StringsManager.onboardingScreenTitle,
                    textAlign: TextAlign.center,
                    style: get24BoldStyle(color: AppColors.textPrimary),
                  ),
                  Text(
                    StringsManager.onboardingScreentext,
                    textAlign: TextAlign.center,
                    style: get14MediumStyle(color: AppColors.textSecondary),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.pushNamed(Routes.holderRoutes);
                    },
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: Text(
                      StringsManager.oboardingScreenTextButton,
                      style: get16MediumStyle(color: AppColors.textOnPrimary),
                    ),
                    iconAlignment: IconAlignment.end,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
