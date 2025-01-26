

import 'package:clean_news_app/core/resources/data_state.dart';
import 'package:clean_news_app/features/daily_news/data/models/article.dart';
import 'package:clean_news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<DataState<List<ArticleModel>>> getNewArticle() {
    // TODO: implement getNewArticle
    throw UnimplementedError();
  }
}