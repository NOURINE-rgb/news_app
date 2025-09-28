import 'dart:async';

import 'package:clean_news_app/features/search/domain/usecases/filter_news_usecase.dart';
import 'package:clean_news_app/features/search/presentation/providers/discover_news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/search_news_usecase.dart';

class DiscoverNewsNotifier extends StateNotifier<DiscoverNewsState> {
  final SearchNewsUseCase _searchNews;
  final FilterNewsUseCase _filterNews;
  //TODO: i will add it when i imlement the search
  Timer? _debounce;
  DiscoverNewsNotifier(
    this._searchNews,
    this._filterNews,
  ) : super(DiscoverNewsState());
  Future<void> search(String query) async {}
  Future<void> filter(FilterNewsParams params) async {}
  Future<void> deleteQuery()async{}
  Future<void> getHistory()async{}
  Future<void> addToHistory()async{
    // consider it's already exist in history so first delete here and add it to the top
  }
}
