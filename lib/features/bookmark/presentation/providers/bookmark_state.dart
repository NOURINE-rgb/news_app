import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

class BookmarkState extends Equatable {
  final bool isLoading;
  final List<ArticleEntity> bookmarkedArticles;
  final String? errorMessage;
  final Map<String, bool> statusBookmark;

  const BookmarkState({
    this.bookmarkedArticles = const [],
    this.isLoading = false,
    this.errorMessage,
    this.statusBookmark = const {},
  });

  BookmarkState copyWith({
    List<ArticleEntity>? bookmarkedArticles,
    bool? isLoading,
    String? errorMessage,
    Map<String, bool>? bookmarkStatus,
  }) {
    return BookmarkState(
      bookmarkedArticles: bookmarkedArticles ?? this.bookmarkedArticles,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      statusBookmark: bookmarkStatus ?? statusBookmark,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, bookmarkedArticles, errorMessage, statusBookmark];
}
