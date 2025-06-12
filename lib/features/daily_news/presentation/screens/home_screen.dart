import 'package:clean_news_app/features/daily_news/presentation/screens/discover_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/favorites_screen.dart';
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
    final pageIndex = ref.watch(homePageProvider);
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: (value) =>
            ref.read(homePageProvider.notifier).changeIndex(value),
        children: [
          TrendingScreen(),
          ArticleDetailScreen(),
          DiscoverScreen(),
        ],
      ),
      // i will test this tomorow if it works or no
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) => _pageController.jumpToPage(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          // i will change this later
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
