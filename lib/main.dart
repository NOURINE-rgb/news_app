import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/my_app.dart';
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


