import 'package:clean_news_app/core/network/api_connstants.dart';
import 'package:clean_news_app/core/errors/exceptions.dart';
import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';

abstract class NewsApiService {
  Future<List<ArticleModel>> getWallStreetArticles();
  Future<List<ArticleModel>> getBreakingNewsArticles(AllArticleParameters parametrs);
}

class NewsApiServiceImpl implements NewsApiService {
  final Dio dio;
  const NewsApiServiceImpl({required this.dio});
  @override
  Future<List<ArticleModel>> getWallStreetArticles() async {
    final response = await dio.get(ApiConstance.wallStreetArticles);
    if (response.statusCode == 200) {
      return (response.data["articles"] as List)
          .map(
            (e) => ArticleModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }
  
  @override
  Future<List<ArticleModel>> getBreakingNewsArticles(AllArticleParameters parametrs) async{
    final response = await dio.get(ApiConstance.allArticles(parametrs.query, parametrs.sortedBY));
    if (response.statusCode == 200) {
      return (response.data["articles"] as List)
          .map(
            (e) => ArticleModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException(errorMessage: response.data);
    }
  }
}
