import 'package:clean_news_app/core/network/api_connstants.dart';
import 'package:clean_news_app/core/errors/exceptions.dart';
import 'package:clean_news_app/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';

abstract class NewsApiService {
  Future<List<ArticleModel>> getBreakingNewsArticles(String category);
  Future<List<ArticleModel>> getRecommendedNews();
}

class NewsApiServiceImpl implements NewsApiService {
  final Dio dio;
  const NewsApiServiceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getBreakingNewsArticles(String category) async {
    try {
      final response = await dio.get(ApiConstance.breaking(category));
      if (response.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(response.data);
        return newsResponse.articles;
      } else {
        throw ServerException(
            message: 'Failed to fetch news: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException(message: 'Unknown error: $e');
    }
  }

  @override
  Future<List<ArticleModel>> getRecommendedNews() async {
    try {
      final response = await dio.get(ApiConstance.recommended);
      if (response.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(response.data);
        return newsResponse.articles;
      } else {
        throw ServerException(
            message: 'Failed to fetch news: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException(message: 'Unknown error: $e');
    }
  }
}

ServerException _handleDioError(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout) {
    return ServerException(message: 'Connection timeout');
  } else if (e.type == DioExceptionType.badResponse) {
    return ServerException(message: 'Bad response: ${e.response?.statusCode}');
  } else if (e.type == DioExceptionType.connectionError) {
    return ServerException(message: 'No internet connection');
  } else {
    return ServerException(message: 'Unexpected error: ${e.message}');
  }
}
