import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/bookmark/data/datasource/bookmark_local_datasource.dart';
import 'package:clean_news_app/features/bookmark/data/repositories/bookmark_repo_impl.dart';
import 'package:clean_news_app/features/bookmark/domain/repositories/bookmark_repo.dart';
import 'package:clean_news_app/core/network/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/onboarding/usecaases/check_onboarding_seen.dart';
import 'package:clean_news_app/features/onboarding/usecaases/set_seen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import '../../features/bookmark/domain/usecases/bookmark_article_usecase.dart';
import '../../features/bookmark/domain/usecases/check_bookmark_status_usecase.dart';
import '../../features/bookmark/domain/usecases/get_bookmarked_articels.dart';
import '../../features/bookmark/domain/usecases/unbookmark_article_usecase.dart';
import '../../features/onboarding/data/local_data_source.dart';
import '../constants/storage_keys.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupHive();
  await dotenv.load(fileName: ".env");
  // dio package
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = "https://newsapi.org/v2";
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers = {'Content-Type': 'application/json'};
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
    return dio;
  });

  await _setupDataSource();
  await _setupRepositories();
  await _setupUseCases();
}

Future<void> _setupHive() async {
  await Hive.initFlutter();
  await Hive.openBox(StorageKeys.onboardingBox);
  await Hive.openBox<ArticleEntity>(StorageKeys.bookmarkBox);
  Hive.registerAdapter(ArticleEntityAdapter());
  sl.registerLazySingleton<Box<ArticleEntity>>(
    () => Hive.box<ArticleEntity>(StorageKeys.bookmarkBox),
  );
}

Future<void> _setupDataSource() async {
  sl.registerLazySingleton<NewsApiService>(
    () => NewsApiServiceImpl(dio: sl()),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSource(Hive.box(StorageKeys.onboardingBox)),
  );
  sl.registerLazySingleton<BookmarkLocalDataSource>(
    () => BookmarkLocalDataSourceImpl(sl()),
  );
}

Future<void> _setupRepositories() async {
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BookmarkRepo>(
    () => BookmarkRepoImpl(localDataSource: sl()),
  );
}

Future<void> _setupUseCases() async {
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
  // Bookmark UseCases
  sl.registerLazySingleton<BookmarkArticleUseCase>(
    () => BookmarkArticleUseCase(sl()),
  );
  sl.registerLazySingleton<RemoveBookmarkUseCase>(
    () => RemoveBookmarkUseCase(sl()),
  );
  sl.registerLazySingleton<GetBookmarkedArticlesUseCase>(
    () => GetBookmarkedArticlesUseCase(sl()),
  );
  sl.registerLazySingleton<CheckBookmarkStatusUseCase>(
    () => CheckBookmarkStatusUseCase(sl()),
  );
}
