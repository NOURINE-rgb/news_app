import 'package:clean_news_app/core/shared/entities/article.dart';
import 'package:clean_news_app/features/search/data/local_data_source/search_local_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';  
import '../../../../core/network/news_api_service.dart';
import '../../domain/repositories/discover_repo.dart';
import '../../domain/usecases/filter_news_usecase.dart';

class DiscoverRepoImpl implements DiscoverRepo {
  final NewsApiService apiService;
  final SearchLocalDatasource localDatasource;
  DiscoverRepoImpl(this.apiService, this.localDatasource);

  @override
  Future<Either<String, List<ArticleEntity>>> searchNews(String query) async {
    try {
      await localDatasource.addToHistory(query);
      final result = await apiService.search(query);
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e) ?? 'Failed to search news');
    } catch (e) {
      return Left('Failed to search news');
    }
  }

  @override
  Future<Either<String, List<ArticleEntity>>> filterNews(
      FilterNewsParams params) async {
    try {
      final result = await apiService.filterNews(params);
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e) ?? 'Failed to Filter news');
    } catch (e) {
      return Left('Failed to Filter news');
    }
  }

  @override
  Future<Either<String, void>> addToHistory(String query) async {
    try {
      await localDatasource.addToHistory(query);
      return Right(null);
    } catch (e) {
      return Left('Failed to add to history');
    }
  }

  @override
  Future<Either<String, void>> deleteFromHistory(String query) async {
    try {
      await localDatasource.deleteSearch(query);
      return Right(null);
    } catch (e) {
      return Left('Failed to delete from history');
    }
  }

  @override
  Future<Either<String, List<String>>> getHisotrySearch() async {
    try {
      final result = localDatasource.getHistorySearch();
      return Right(result);
    } catch (e) {
      return Left('Failed to get search history');
    }
  }

  String? _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return ('Connection timeout');
    } else if (e.type == DioExceptionType.badResponse) {
      return ('Bad response: ${e.response}');
    } else if (e.type == DioExceptionType.connectionError) {
      return ('No internet connection');
    } else {
      return null;
    }
  }
}
