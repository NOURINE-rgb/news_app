import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import "package:dartz/dartz.dart";

abstract class ArticleRepository {
  Future<Either<Failure,List<ArticleEntity>>> getWallStreetArticles();
  Future<Either<Failure,List<ArticleEntity>>> getBreakingNewsArticles(AllArticleParameters parameter);
}
