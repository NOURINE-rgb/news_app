import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/core/shared/entities/article.dart';
import "package:dartz/dartz.dart";

abstract class ArticleRepository {
  Future<Either<Failure,List<ArticleEntity>>> getRecommondedNews();
  Future<Either<Failure,List<ArticleEntity>>> getBreakingNewsArticles(String category,int page);
}
