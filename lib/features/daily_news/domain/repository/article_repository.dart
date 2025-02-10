import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import "package:dartz/dartz.dart";

abstract class ArticleRepository {
  Future<Either<Failure,List<ArticleEntity>>> getWallStreetArticles();
}
