import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/home/news_notifier.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/home/news_state.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/see_all/see_all_notifier.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/see_all/see_all_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) {
    return NewsNotifier(
        sl<GetRecomandedArticleUseCase>(), sl<GetBreakingNewsArticleUseCase>());
  },
);

final seeAllNotifierProvider =
    StateNotifierProvider.family<SeeAllNotifier, SeeAllState, SeeAllParams>(
  (ref, params) => SeeAllNotifier(
    params,
    sl<GetBreakingNewsArticleUseCase>(),
  ),
);

// category for home page
final selectedCategoryHomeProvider = StateProvider.autoDispose<int>((ref) => 0);
// for the search page
final selectedCategorySearchProvider =
    StateProvider.autoDispose<int>((ref) => 0);
final selectedCountryIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final selectedSortIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
