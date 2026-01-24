import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/search/domain/repositories/discover_repo.dart';
import 'package:dartz/dartz.dart';

class SearchNewsUseCase {
  final DiscoverRepo repo;
  SearchNewsUseCase(this.repo);

  Future<Either<String, List<ArticleEntity>>> call(String query) async {
    return await repo.searchNews(query);
  }
}
