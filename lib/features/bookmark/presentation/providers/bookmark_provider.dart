import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/bookmark/domain/usecases/bookmark_article_usecase.dart';
import 'package:clean_news_app/features/bookmark/domain/usecases/check_bookmark_status_usecase.dart';
import 'package:clean_news_app/features/bookmark/domain/usecases/get_bookmarked_articels.dart';
import 'package:clean_news_app/features/bookmark/presentation/providers/bookmark_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../daily_news/domain/entities/article.dart';
import '../../domain/usecases/unbookmark_article_usecase.dart';

class BookmarkNotifier extends StateNotifier<BookmarkState> {
  final BookmarkArticleUseCase _bookmarkArticle;
  final RemoveBookmarkUseCase _removeBookmark;
  final GetBookmarkedArticlesUseCase _getBookmarkedArticles;
  final CheckBookmarkStatusUseCase _checkBookmarkStatus;
  BookmarkNotifier(this._bookmarkArticle, this._checkBookmarkStatus,
      this._getBookmarkedArticles, this._removeBookmark)
      : super(const BookmarkState());

  Future<void> toggleBookmark(ArticleEntity article) async {
    final isBookmarked = state.statusBookmark[article.url] ??
        await _checkBookmarkStatus.call(article.url);
    if (isBookmarked) {
      final result = await _removeBookmark.call(article);
      result.fold(
        (error) {
          state = state.copyWith(errorMessage: error);
        },
        (_) {
          state = state.copyWith(
              bookmarkedArticles: state.bookmarkedArticles
                  .where(
                    (e) => e.url != article.url,
                  )
                  .toList(),
              bookmarkStatus: {...state.statusBookmark, article.url: false});
        },
      );
    } else {
      final result = await _bookmarkArticle.call(article);
      result.fold(
        (error) {
          state = state.copyWith(errorMessage: error);
        },
        (_) {
          state = state.copyWith(
              bookmarkedArticles: [...state.bookmarkedArticles, article],
              bookmarkStatus: {...state.statusBookmark, article.url: true});
        },
      );
    }
  }

  Future<void> getBookmarkedArticles() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _getBookmarkedArticles.call();
    result.fold(
      (error) {
        state = state.copyWith(isLoading: false, errorMessage: error);
      },
      (articles) {
        state = state.copyWith(
            isLoading: false,
            bookmarkedArticles: articles,
            bookmarkStatus: articles
                .asMap()
                .map((_, article) => MapEntry(article.url, true)));
      },
    );
  }

  Future<bool> checkBookmarkStatus(String articleUrl) async {
    if (state.statusBookmark.containsKey(articleUrl)) {
      return state.statusBookmark[articleUrl]!;
    }
    final isBookmarked = await _checkBookmarkStatus.call(articleUrl);
    state = state.copyWith(
        bookmarkStatus: {...state.statusBookmark, articleUrl: isBookmarked});
    return isBookmarked;
  }
}

final bookmarkProvider = StateNotifierProvider<BookmarkNotifier, BookmarkState>(
  (ref) => BookmarkNotifier(
    sl<BookmarkArticleUseCase>(),
    sl<CheckBookmarkStatusUseCase>(),
    sl<GetBookmarkedArticlesUseCase>(),
    sl<RemoveBookmarkUseCase>(),
  ),
);
