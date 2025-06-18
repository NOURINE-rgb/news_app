import 'package:clean_news_app/features/daily_news/presentation/screens/discover_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/trending_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Text("screen1"),
      ),
    );
  }
}
