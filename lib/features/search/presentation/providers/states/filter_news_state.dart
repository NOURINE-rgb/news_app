import '../../../../../core/shared/entities/article.dart';

class FilterNewsState {
  final bool isLoading;
  final List<ArticleEntity> results;
  final String? error;

  const FilterNewsState({
    this.isLoading = false,
    this.results = const [],
    this.error,
  });

  FilterNewsState copyWith({
    bool? isLoading,
    List<ArticleEntity>? results,
    String? error,
  }) {
    return FilterNewsState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      // Explicitly handle null error to clear it
      error: error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FilterNewsState &&
        other.isLoading == isLoading &&
        other.results == results &&
        other.error == error;
  }

  @override
  int get hashCode => Object.hash(isLoading, results, error);
}