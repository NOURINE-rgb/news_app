import 'package:clean_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
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
}
