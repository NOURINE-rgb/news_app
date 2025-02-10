import 'package:clean_news_app/core/constants/constants.dart';
import 'package:clean_news_app/core/errors/exceptions.dart';
import 'package:clean_news_app/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';

abstract class NewsApiService {
  Future<List<ArticleModel>> getWallStreetArticles();
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
}
