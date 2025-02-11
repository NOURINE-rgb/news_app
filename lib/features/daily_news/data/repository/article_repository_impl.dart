import 'package:clean_news_app/core/errors/exceptions.dart';
import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getWallStreetArticles() async {
    try {
      final result = await _newsApiService.getWallStreetArticles();
      return Right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.errorMessage.message));
    } catch (e) {
      return left(
        ServerFailure("unexpected error : ${e.toString()}"),
      );
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getBreakingNewsArticles(AllArticleParameters parameters) async {
    try {
      final result = await _newsApiService.getBreakingNewsArticles(parameters);
      return Right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(e.errorMessage.message));
    } catch (e) {
      return left(
        ServerFailure("unexpected error : ${e.toString()}"),
      );
    }
  }
}
