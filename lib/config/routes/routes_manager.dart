import 'package:clean_news_app/core/constants/strings_manager.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/discover_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/article_details_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/home_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/news_holder_screen.dart';
import 'package:clean_news_app/features/daily_news/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String holderRoutes = "/holder_screen";
  static const String onboardingRoute = "/onboarding";
  static const String discoverRoute = "/discover";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OboardingScreen());
      case Routes.holderRoutes:
        return MaterialPageRoute(builder: (_) => NewsHolderScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.discoverRoute:
        return MaterialPageRoute(builder: (_) => DiscoverScreen());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => ArticleDetailScreen());
      // il reste the custom splash screen
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(StringsManager.noRouteFound),
        ),
      ),
    );
  }
}
