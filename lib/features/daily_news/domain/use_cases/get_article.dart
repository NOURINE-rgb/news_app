import 'package:clean_news_app/core/resources/data_state.dart';
import 'package:clean_news_app/core/use_cases/usecase.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  const GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewArticle();
  }
}
