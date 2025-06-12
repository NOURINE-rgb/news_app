import "package:clean_news_app/config/theme/color_manager.dart";
import "package:clean_news_app/config/theme/values_manager.dart";
import "package:clean_news_app/core/helpers/assets_manager.dart";
import "package:clean_news_app/core/helpers/strings_manager.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
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
              height: 400.h,
              width: double.infinity.w,
              padding: EdgeInsets.all(AppPadding.p24.sp),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(StringsManager.onboardingScreenTitle,
                      textAlign: TextAlign.center,
                      style: TextTheme.of(context).headlineSmall),
                  Text(
                    StringsManager.onboardingScreentext,
                    textAlign: TextAlign.center,
                    style: TextTheme.of(context).titleLarge,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      //todo : go to home page
                    },
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: Text(
                      StringsManager.oboardingScreenTextButton,
                      style: TextTheme.of(context).bodyLarge,
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
