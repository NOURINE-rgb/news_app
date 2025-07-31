

import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_recommended_article.dart';
import 'package:clean_news_app/features/daily_news/presentation/providers/state/news_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsNotifier extends StateNotifier<NewsState>{
  final GetRecomandedArticleUseCase getRecommendedArticle;
  final GetBreakingNewsArticleUseCase getBreakingNewsArticle;
  NewsNotifier(this.getRecommendedArticle,this.getBreakingNewsArticle) : super(NewsInitialState());
  Future<void> getRecommendedNews()async{
    state = NewsLoadingState();
    final result = await getRecommendedArticle.call();
    result.fold(
      (failure) => state = NewsErrorState(failure: failure),
      (articles) => state = NewsLoadedState(articles: articles),
    );
  }

}