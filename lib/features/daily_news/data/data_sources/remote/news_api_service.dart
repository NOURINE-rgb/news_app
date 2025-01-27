

import 'package:clean_news_app/core/constants/constants.dart';
import 'package:clean_news_app/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part "news_api_service.g.dart";

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;
  @GET('/top-headlines')
  // httpresponse for the details the status of http if it failed or not something like this
  Future<HttpResponse<List<ArticleModel>>> getNewArticles({
    @Query('apiKey') String ? apiKey,
    @Query('country') String ? country,
    @Query('category') String ? category,
  });
}
