import 'package:clean_news_app/core/shared/entities/article.dart';

class DiscoverNewsState {
  final bool isLoading;
  final List<ArticleEntity> results;
  final List<String> history;
  final String? error;

  DiscoverNewsState({
    this.isLoading = false,
    this.results = const [],
    this.history = const [],
    this.error,
  });

  DiscoverNewsState copyWith({
    bool? isLoading,
    List<ArticleEntity>? results,
    List<String>? history,
    String? error,
  }) {
    return DiscoverNewsState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      history: history ?? this.history,
      error: error,
    );
  }
}