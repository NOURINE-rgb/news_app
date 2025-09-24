import 'package:clean_news_app/config/theme/app_colors.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/discover_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/bookmark_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NewsHolderScreen extends StatefulWidget {
  const NewsHolderScreen({super.key});

  @override
  State<NewsHolderScreen> createState() => _NewsHolderScreenState();
}

class _NewsHolderScreenState extends State<NewsHolderScreen> {
  late final PersistentTabController _controller;

  static const List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    BookmarkScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.shadowColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Discover",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.shadowColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark_border),
        title: "Bookmark",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.shadowColor,
      ),
    ];
  }

  @override
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
