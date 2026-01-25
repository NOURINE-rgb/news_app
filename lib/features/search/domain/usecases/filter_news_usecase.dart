import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/search/domain/repositories/discover_repo.dart';
import 'package:dartz/dartz.dart';

class FilterNewsUseCase {
  final DiscoverRepo repo;
  FilterNewsUseCase(this.repo);

  Future<Either<String,List<ArticleEntity>>> call(FilterNewsParams params) async {
    return await repo.filterNews(params);
  }
}

class FilterNewsParams {
  FilterNewsParams(
      {required this.category, required this.country, required this.sortBy});
  final String category;
  final String country;
  final String sortBy;
}
