import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    try {
      final result = await Future.wait([
        getBreakingNewsArticle.call(params: "general"),
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
            failureMessage: _mapFailureToMessage(failure!));
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
    } catch (e) {
      state = state.copyWith(
          isBreakingLoading: false,
          isRecommendedLoading: false,
          failureMessage: e.toString());
    }
  }

  Future<void> loadBreakingNewsByCategory(String category) async {
    state = state.copyWith(isBreakingLoading: true, failureMessage: null);
    final result = await getBreakingNewsArticle.call(params: category);
    result.fold((failure) {
      state = state.copyWith(
          isBreakingLoading: false,
          failureMessage: _mapFailureToMessage(failure));
    }, (articles) {
      state = state.copyWith(
          isBreakingLoading: false,
          breakingArticles: articles,
          failureMessage: null);
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Error: ${failure.message}';
    } else if (failure is NetworkFailure) {
      return 'Network Error: ${failure.message}';
    } else {
      return 'Unknown Error: ${failure.message}';
    }
  }
}
