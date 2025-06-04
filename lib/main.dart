import 'package:clean_news_app/config/theme/theme_manager.dart';
import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  setupLocator();
  // this to ensure that the fonts it's loaded before the app run in slower internet
  GoogleFonts.commissioner();
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
      theme: AppTheme.lightTheme(),
      home: WelcomePage(),
    );
  }
}
