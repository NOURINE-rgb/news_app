import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_news_app/core/errors/failures.dart';

class GetBreakingNewsArticleUseCase
    implements BaseUseCase<List<ArticleEntity>, AllArticleParameters> {
  final ArticleRepository _articleRepository;
  const GetBreakingNewsArticleUseCase(this._articleRepository);


  @override
  Future<Either<Failure, List<ArticleEntity>>> call(
      {required AllArticleParameters params}) async {
    return await _articleRepository.getBreakingNewsArticles(params);
  }
}
