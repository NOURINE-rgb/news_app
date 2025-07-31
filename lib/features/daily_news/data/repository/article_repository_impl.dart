import 'package:clean_news_app/core/errors/exceptions.dart';
import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getRecommondedNews() async {
    try {
      final articles = await _newsApiService.getRecommendedNews();
      return Right(articles);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getBreakingNewsArticles() async{
    try {
      final articles = await _newsApiService.getBreakingNewsArticles();
      return Right(articles);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('An unexpected error occurred: $e'));
    }
  }
}
