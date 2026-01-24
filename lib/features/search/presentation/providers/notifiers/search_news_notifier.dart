import 'dart:async';
import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/search/domain/usecases/add_history.dart';
import 'package:clean_news_app/features/search/domain/usecases/get_history_search_usecase.dart';
import 'package:clean_news_app/features/search/domain/usecases/remove_history.dart';
import 'package:clean_news_app/features/search/presentation/providers/states/search_news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/search_news_usecase.dart';

class SearchNewsNotifier extends StateNotifier<SearchNewsState> {
  final SearchNewsUseCase _searchNews;
  final AddToHistoryUsecase _addToHistory;
  final RemoveFromHistoryUsecase _removeFromHistory;
  final GetHistorySearchUsecase _getHistorySearch;
  SearchNewsNotifier(this._searchNews, this._addToHistory,
      this._removeFromHistory, this._getHistorySearch)
      : super(SearchNewsState()) {
    getHistory();
  }
  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;
    await _addToHistory(query);
    state = state.copyWith(isLoading: true, error: null);
    final result = await _searchNews(query.trim());
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
  Future<void> deleteFromHistory(String query) async {
    final result = await _removeFromHistory(query);
    result.fold(
      (l) => state = state.copyWith(error: l),
      (r) => getHistory(),
    );
  }

  Future<void> getHistory() async {
    final result = await _getHistorySearch();
    result.fold(
      (l) => state = state.copyWith(error: l),
      (r) => state = state.copyWith(history: r),
    );
  }
}

final searchNewsProvider =
    StateNotifierProvider<SearchNewsNotifier, SearchNewsState>(
  (ref) => SearchNewsNotifier(
      sl<SearchNewsUseCase>(),
      sl<AddToHistoryUsecase>(),
      sl<RemoveFromHistoryUsecase>(),
      sl<GetHistorySearchUsecase>()),
);
