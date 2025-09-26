import 'package:clean_news_app/config/routes/routes_manager.dart';
import 'package:clean_news_app/config/theme/theme_manager.dart';
import 'package:clean_news_app/features/onboarding/usecaases/check_onboarding_seen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/service/dependency_injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 890),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          
          final seen = sl<CheckOnboardingSeen>().call();
          return MaterialApp(
            title: 'Flutter Demo',
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            initialRoute: seen ? Routes.holderRoutes : Routes.onboardingRoute,
            onGenerateRoute: RouteGenerator.getRoute,
            theme: getAppTheme(),
          );
        });
  }
}
