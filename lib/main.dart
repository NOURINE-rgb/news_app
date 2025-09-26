import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/my_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await setupLocator();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ProviderScope(
        child: const MyApp(),
      ),
    ),
  );
}
