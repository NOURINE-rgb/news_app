import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/news_notifier.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) {
    return NewsNotifier(sl<GetRecomandedArticleUseCase>(),sl<GetBreakingNewsArticleUseCase>());
  },
);
final selectedCategoryIndexProvider = StateProvider<int>((ref) => 0);