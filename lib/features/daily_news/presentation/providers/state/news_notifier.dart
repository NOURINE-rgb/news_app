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
      : super(NewsInitialState());
  Future<void> loadAllNews() async {
    state = NewsLoadingState();
    try {
      final results = await Future.wait([
        getRecommendedArticle.call(),
        getBreakingNewsArticle.call(),
      ]);
      final breakingResult = results[0];
      final recommendedResult = results[1];
      if (breakingResult.isLeft() || recommendedResult.isLeft()) {
        final failure = breakingResult.isLeft()
            ? breakingResult.fold((l) => l, (r) => null)
            : recommendedResult.fold((l) => l, (r) => null);
        state = NewsErrorState(failureMessage: _mapFailureToMessage(failure!));
      } else {
        final breakingNews = breakingResult.fold(
          (l) => <ArticleEntity>[],
          (r) => r,
        );
        final recommendedNews = recommendedResult.fold(
          (l) => <ArticleEntity>[],
          (r) => r,
        );
        state = NewsLoadedState(
          breakingArticles: breakingNews,
          recommendedArticles: recommendedNews,
        );
      }
    } catch (e) {
      state =
          NewsErrorState(failureMessage: 'An unexpected error occurred: $e');
    }
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
