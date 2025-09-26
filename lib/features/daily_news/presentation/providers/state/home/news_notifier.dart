import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/home/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/helpers/map_failure_message.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final GetRecomandedArticleUseCase getRecommendedArticle;
  final GetBreakingNewsArticleUseCase getBreakingNewsArticle;
  NewsNotifier(this.getRecommendedArticle, this.getBreakingNewsArticle)
      : super(NewsState());

  Future<void> loadAllNews() async {
    state = state.copyWith(
        isBreakingLoading: true,
        isRecommendedLoading: true,
        failureMessage: null);
    final result = await Future.wait([
      getBreakingNewsArticle.call(
          params: BreakingNewsParams(category: "business", page: 1)),
      getRecommendedArticle.call()
    ]);
    final breakingResult = result[0];
    final recommendedResult = result[1];
    if (breakingResult.isLeft() || recommendedResult.isLeft()) {
      final failure = breakingResult.isLeft()
          ? breakingResult.fold((l) => l, (r) => null)
          : recommendedResult.fold((l) => l, (r) => null);
      state = state.copyWith(
          isBreakingLoading: false,
          isRecommendedLoading: false,
          failureMessage: mapFailureToMessage(failure!));
      return;
    }
    final breakingNews = breakingResult.fold(
      (l) => <ArticleEntity>[],
      (r) => r,
    );
    final recommendedNews = recommendedResult.fold(
      (l) => <ArticleEntity>[],
      (r) => r,
    );
    state = state.copyWith(
        isBreakingLoading: false,
        isRecommendedLoading: false,
        breakingArticles: breakingNews,
        recommendedArticles: recommendedNews,
        failureMessage: null);
  }

  Future<void> loadBreakingNewsByCategory(String category) async {
    state = state.copyWith(
        isBreakingLoading: true, failureMessage: null, breakingCurrentPage: 1);
    final result = await getBreakingNewsArticle.call(
        params: BreakingNewsParams(category: category, page: 1));
    result.fold((failure) {
      state = state.copyWith(
          isBreakingLoading: false,
          failureMessage: mapFailureToMessage(failure));
    }, (articles) {
      state = state.copyWith(
          isBreakingLoading: false,
          breakingArticles: articles,
          hasMoreBreaking: articles.isNotEmpty,
          failureMessage: null);
    });
  }

  Future<void> loadMoreBreakingNews(String category) async {
    if (state.isBreakingMoreLoading || !state.hasMoreBreaking) return;
    final nextPage = state.breakingCurrentPage + 1;
    state = state.copyWith(
      isBreakingMoreLoading: true,
      failureMessage: null,
    );
    final result = await getBreakingNewsArticle.call(
        params: BreakingNewsParams(category: category, page: nextPage));
    result.fold((failure) {
      state = state.copyWith(
          isBreakingMoreLoading: false,
          failureMessage: mapFailureToMessage(failure));
    }, (articles) {
      state = state.copyWith(
        isBreakingMoreLoading: false,
        breakingArticles: [...state.breakingArticles, ...articles],
        breakingCurrentPage: nextPage,
        hasMoreBreaking: articles.isNotEmpty,
      );
    });
  }
}
