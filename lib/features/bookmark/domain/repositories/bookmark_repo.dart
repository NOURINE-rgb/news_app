import 'package:dartz/dartz.dart';

import '../../../daily_news/domain/entities/article.dart';

abstract class BookmarkRepo {
  Future<Either<String, List<ArticleEntity>>> getBookmarkedArticles();
  Future<Either<String, void>> bookmarkArticle(ArticleEntity article);
  Future<Either<String, void>> unBookmarkArticle(ArticleEntity article);
  Future<bool> isArticleBookmarked(String articleUrl);
}
