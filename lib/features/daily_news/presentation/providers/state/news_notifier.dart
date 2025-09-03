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
    state = state.copyWith(isBreakingLoading: true, isRecommendedLoading: true);
    try {
      final result = await Future.wait(
          [getBreakingNewsArticle(params: "general"), getRecommendedArticle()]);
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
        return;
      }
      final breakingArticles = breakingResult.fold(
        (l) => [],
        (r) => r,
      );
      final recommendedArticles = recommendedResult.fold(
        (l) => [],
        (r) => r,
      );
      state = state.copyWith(
          isBreakingLoading: false,
          isRecommendedLoading: false,
          breakingArticles: breakingArticles,
          recommendedArticles: recommendedArticles,
          failureMessage: null);
    } catch (e) {
      state = state.copyWith(
          isBreakingLoading: false,
          isRecommendedLoading: false,
          failureMessage: e.toString());
    }
  }

  Future<void> loadBreakingNewsByCategory(String category) async {}

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
