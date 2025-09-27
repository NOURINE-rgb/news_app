import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_news_app/core/errors/failures.dart';

class GetBreakingNewsArticleUseCase {
  final ArticleRepository _articleRepository;
  const GetBreakingNewsArticleUseCase(this._articleRepository);

  Future<Either<Failure, List<ArticleEntity>>> call(
      {required BreakingNewsParams params}) async {
    return await _articleRepository.getBreakingNewsArticles(
        params.category, params.page);
  }
}

class BreakingNewsParams {
  BreakingNewsParams({required this.category, required this.page});
  final String category;
  final int page;
}
