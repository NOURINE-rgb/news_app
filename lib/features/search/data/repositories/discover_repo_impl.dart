import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/news_api_service.dart';
import '../../domain/repositories/discover_repo.dart';
import '../../domain/usecases/filter_news_usecase.dart';

class DiscoverRepoImpl implements DiscoverRepo {
  final NewsApiService apiService;
  DiscoverRepoImpl(this.apiService);

  @override
  Future<Either<String, List<ArticleEntity>>> searchNews(String query) {
    try {} catch (e) {}
  }

  @override
  Future<Either<String, List<ArticleEntity>>> filterNews(
      FilterNewsParams params) {
    try {} catch (e) {}
  }

  @override
  Future<Either<String, List<String>>> addToHistory(String query) {
    try {} catch (e) {}
  }

  @override
  Future<Either<String, List<String>>> deleteFromHistory(String query) {
    try {} catch (e) {}
  }

  @override
  Future<Either<String, List<String>>> getHisotrySearch() {
    try {} catch (e) {}
  }
}
