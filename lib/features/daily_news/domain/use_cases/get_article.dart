import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_news_app/core/errors/failures.dart';


class GetArticleUseCase
    implements BaseUseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;
  const GetArticleUseCase(this._articleRepository);

  @override
  Future<Either<Failure,List<ArticleEntity>>> call({void params}) async {
    return await _articleRepository.getWallStreetArticles();
  }
}
