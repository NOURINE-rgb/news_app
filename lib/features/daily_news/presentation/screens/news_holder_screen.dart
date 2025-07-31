import 'package:clean_news_app/config/theme/color_manager.dart';
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
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: ColorManager.mediumGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.trending_up),
        title: "Trending",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: ColorManager.mediumGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Discover",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: ColorManager.mediumGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark_border),
        title: "Bookmark",
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: ColorManager.mediumGrey,
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
