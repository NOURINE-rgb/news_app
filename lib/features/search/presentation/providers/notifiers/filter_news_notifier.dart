import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/search/presentation/providers/states/filter_news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/filter_news_usecase.dart';

class FilterNewsNotifier extends StateNotifier<FilterNewsState> {
  final FilterNewsUseCase _filterNews;
  FilterNewsNotifier(this._filterNews) : super(FilterNewsState());

  Future<void> filter(FilterNewsParams params) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _filterNews(params);
    result.fold(
      (error) => state = state.copyWith(
        isLoading: false,
        error: error,
      ),
      (articles) => state = state.copyWith(
        isLoading: false,
        results: articles,
        error: null,
      ),
    );
  }
}

final filterNewsProvider =
    StateNotifierProvider<FilterNewsNotifier, FilterNewsState>(
  (ref) => FilterNewsNotifier(sl<FilterNewsUseCase>()),
);
