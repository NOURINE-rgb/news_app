import 'package:clean_news_app/core/shared/entities/article.dart';

class SearchNewsState {
  final bool isLoading;
  final List<ArticleEntity> results;
  final List<String> history;
  final String? error;

  SearchNewsState({
    this.isLoading = false,
    this.results = const [],
    this.history = const [],
    this.error,
  });

  SearchNewsState copyWith({
    bool? isLoading,
    List<ArticleEntity>? results,
    List<String>? history,
    String? error,
  }) {
    return SearchNewsState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      history: history ?? this.history,
      error: error,
    );
  }
}
