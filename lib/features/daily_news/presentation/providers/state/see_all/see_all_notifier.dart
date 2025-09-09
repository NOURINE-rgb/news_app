import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/see_all/see_all_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/helpers/map_failure_message.dart';
import '../../../../domain/entities/article.dart';

class SeeAllParams {
  final List<ArticleEntity> initialNews;
  final String category;
  final int currentPage;

  SeeAllParams({
    required this.initialNews,
    required this.category,
    required this.currentPage,
  });
}

class SeeAllNotifier extends StateNotifier<SeeAllState> {
  final GetBreakingNewsArticleUseCase _getBreakingArticle;
  final SeeAllParams params;
  SeeAllNotifier(this.params, this._getBreakingArticle)
      : super(SeeAllState()) {
    state = state.copyWith(
        articles: params.initialNews,
        hasMore: params.initialNews.isNotEmpty,
        currentPage: params.currentPage);
  }

  Future<void> loadMoreArticles() async {
    if (state.isLoading || !state.hasMore) return;
    final nextPage = state.currentPage + 1;
    state = state.copyWith(
      isLoading: true,
      failureMessage: null,
    );
    final result = await _getBreakingArticle.call(
        params: BreakingNewsParams(category: params.category, page: nextPage));
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          failureMessage: mapFailureToMessage(failure),
        );
      },
      (articles) {
        state = state.copyWith(
          isLoading: false,
          articles: [...state.articles, ...articles],
          currentPage: nextPage,
          hasMore: articles.isNotEmpty, 
        );
      },
    );
  }
}
