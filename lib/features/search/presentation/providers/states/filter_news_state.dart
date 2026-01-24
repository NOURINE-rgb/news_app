import '../../../../../core/shared/entities/article.dart';

class FilterNewsState {
  final bool isLoading;
  final List<ArticleEntity> results; 
  final String? error;
  FilterNewsState({
    this.isLoading = false,
    this.results = const [],
    this.error,
  });
  FilterNewsState copyWith({
    bool? isLoading,
    List<ArticleEntity>? results,
    List<String>? history,
    String? error,
  }) {
    return FilterNewsState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      error: error,
    );
  }
}