import 'package:clean_news_app/config/routes/routes_manager.dart';
import 'package:clean_news_app/config/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboardingRoute,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
