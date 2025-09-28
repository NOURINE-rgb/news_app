import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:dartz/dartz.dart';

import '../usecases/filter_news_usecase.dart';

abstract class DiscoverRepo {
  Future<Either<String, List<ArticleEntity>>> searchNews(String query);
  Future<Either<String, List<ArticleEntity>>> filterNews(
      FilterNewsParams params);
  Future<Either<String, List<String>>> getHisotrySearch();
  Future<Either<String, List<String>>> addToHistory(String query);
  Future<Either<String, List<String>>> deleteFromHistory(String query);
}
