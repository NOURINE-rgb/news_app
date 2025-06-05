import 'package:clean_news_app/config/routes/routes_manager.dart';
import 'package:clean_news_app/config/theme/theme_manager.dart';
import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  setupLocator();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

//i will change the bottom navigator bar later
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomeRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getAppTheme(),
    );
  }
}
