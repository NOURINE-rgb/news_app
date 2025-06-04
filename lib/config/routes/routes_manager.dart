import 'package:clean_news_app/features/daily_news/presentation/pages/discover_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/favorites_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/home_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/trending_page.dart';
import 'package:clean_news_app/features/daily_news/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String welcomeRoute = "/welcome";
  static const String discoverRoute = "/discover";
  static const String homeRoute = "/home";
  static const String trendingRoute = "/trending";
  static const String detailsRoute = "/details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.trendingRoute:
        return MaterialPageRoute(builder: (_) => TrendingPage());
      case Routes.discoverRoute:
        return MaterialPageRoute(builder: (_) => DiscoverPage());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => ArticleDetailPage());
      // il reste the custom splash screen
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Route Not Found"),
        ),
      ),
    );
  }
}
