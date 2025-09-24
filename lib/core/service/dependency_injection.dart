import 'package:clean_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/onboarding/usecaases/check_onboarding_seen.dart';
import 'package:clean_news_app/features/onboarding/usecaases/set_seen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../../features/onboarding/data/local_data_source.dart';
import '../constants/storage_keys.dart';

final sl = GetIt.instance;

void setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(StorageKeys.onboardingBox);
  await Hive.openBox(StorageKeys.bookmarkBox);
  // dio package
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  });
  // datasource
  sl.registerLazySingleton<NewsApiService>(
    () => NewsApiServiceImpl(dio: sl()),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSource(Hive.box(StorageKeys.onboardingBox)),
  );
  // repositories
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(sl()),
  );
  // useCases
  sl.registerLazySingleton(
    () => GetRecomandedArticleUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => GetBreakingNewsArticleUseCase(sl()),
  );
  sl.registerLazySingleton<SetOnboardingSeen>(
    () => SetOnboardingSeen(
      sl(),
    ),
  );
  sl.registerLazySingleton<CheckOnboardingSeen>(
    () => CheckOnboardingSeen(
      sl(),
    ),
  );
}
