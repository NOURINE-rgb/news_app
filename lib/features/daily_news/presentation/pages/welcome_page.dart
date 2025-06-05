import "package:clean_news_app/config/theme/color_manager.dart";
import "package:clean_news_app/config/theme/app_text_style.dart";
import "package:clean_news_app/config/theme/sizes.dart";
import "package:flutter/material.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    ,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle(
                        color: ColorManager.darkColor,
                        fontSize: FontSize.s34,
                        fontWeight: FontManager.bold),
                  ),
                  Text(
                    ,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle(
                        color: ColorManager.greyColor,
                        fontSize: FontSize.s16,
                        fontWeight: FontManager.regular),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_outlined),
                    label: Text(
                      "Explore",
                      style: AppTextStyles.textStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s20,
                          fontWeight: FontManager.semiBold),
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
