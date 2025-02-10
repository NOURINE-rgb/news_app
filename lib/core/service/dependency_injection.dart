import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
  // dio package
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );
  // dependenceis
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
    () => GetArticleUseCase(sl()),
  );
}
