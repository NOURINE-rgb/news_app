import 'package:clean_news_app/features/daily_news/presentation/pages/discover_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/favorites_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/trending_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/riverpod/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize PageController
  }

  @override
  void dispose() {
    _pageController.dispose(); // Don't forget to dispose of the controller
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
          TrendingPage(),
          FavoritesPage(),
          DiscoverPage(),
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
