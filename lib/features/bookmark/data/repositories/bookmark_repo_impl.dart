import 'package:clean_news_app/features/bookmark/data/datasource/bookmark_local_datasource.dart';
import 'package:clean_news_app/features/bookmark/domain/repositories/bookmark_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/shared/entities/article.dart';

class BookmarkRepoImpl implements BookmarkRepo {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepoImpl({required this.localDataSource});

  @override
  Future<Either<String, void>> bookmarkArticle(ArticleEntity article) async {
    try {
      await localDataSource.bookmarkArticle(article);
      return right(null);
    } catch (e) {
      return left("Failed to bookmark article");
    }
  }

  @override
  Future<Either<String, List<ArticleEntity>>> getBookmarkedArticles() async {
    try {
      final result = await localDataSource.getBookmarkedArticles();
      return right(result);
    } catch (e) {
      return left("Failed to fetch bookmarked articles");
    }
  }

  @override
  Future<Either<String, void>> unBookmarkArticle(ArticleEntity article) async {
    try {
      await localDataSource.unBookmarkArticle(article);
      return right(null);
    } catch (e) {
      return left("Failed to remove bookmark");
    }
  }

  @override
  Future<bool> isArticleBookmarked(String articleUrl) async {
    try {
      return await localDataSource.isArticleBookmarked(articleUrl);
    } catch (e) {
      return false;
    }
  }
}
