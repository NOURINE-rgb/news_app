import 'package:hive/hive.dart';

import '../../../../core/shared/entities/article.dart';

abstract class BookmarkLocalDataSource{
    Future<List<ArticleEntity>> getBookmarkedArticles();
    Future<void> bookmarkArticle(ArticleEntity article);
    Future<void> unBookmarkArticle(ArticleEntity article);
    Future<bool> isArticleBookmarked(String articleUrl);
}

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource{
  final Box<ArticleEntity> _bookmarkBox;
  
  BookmarkLocalDataSourceImpl(this._bookmarkBox);
  
  @override
  Future<void> bookmarkArticle(ArticleEntity article) async {
    await _bookmarkBox.put(article.url, article);
  }

  @override
  Future<List<ArticleEntity>> getBookmarkedArticles() async {
    return _bookmarkBox.values.toList();
  }

  @override
  Future<void> unBookmarkArticle(ArticleEntity article) async {
    await _bookmarkBox.delete(article.url);
  }

  @override
  Future<bool> isArticleBookmarked(String articleUrl) async {
    return _bookmarkBox.containsKey(articleUrl);
  }
}