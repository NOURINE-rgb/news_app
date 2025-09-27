import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_news_app/core/errors/failures.dart';

class GetRecomandedArticleUseCase {
  final ArticleRepository _articleRepository;
  GetRecomandedArticleUseCase(this._articleRepository);

  Future<Either<Failure, List<ArticleEntity>>> call({void params}) async {
    return await _articleRepository.getRecommondedNews();
  }
}
