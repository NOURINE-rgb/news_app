import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

class NewsState extends Equatable {
  final List<ArticleEntity> breakingArticles;
  final List<ArticleEntity> recommendedArticles;
  final String? failureMessage;
  final bool isBreakingLoading;
  final bool isRecommendedLoading;
  // this for pagination
  final int breakingCurrentPage;
  final bool hasMoreBreaking;
  final bool isBreakingMoreLoading;

  const NewsState({
    this.breakingArticles = const [],
    this.recommendedArticles = const [],
    this.isBreakingLoading = false,
    this.isRecommendedLoading = false,
    this.failureMessage,
    this.breakingCurrentPage = 1,
    this.hasMoreBreaking = true,
    this.isBreakingMoreLoading = false,
  });
   NewsState copyWith({
    List<ArticleEntity>? breakingArticles,
    List<ArticleEntity>? recommendedArticles,
    bool? isBreakingLoading,
    bool? isRecommendedLoading,
    String? failureMessage,
    int? breakingCurrentPage,
    bool? hasMoreBreaking,
    bool? isBreakingMoreLoading,
  }) {
    return NewsState(
      breakingArticles: breakingArticles ?? this.breakingArticles,
      recommendedArticles: recommendedArticles ?? this.recommendedArticles,
      isBreakingLoading: isBreakingLoading ?? this.isBreakingLoading,
      isRecommendedLoading: isRecommendedLoading ?? this.isRecommendedLoading,
      failureMessage: failureMessage,
      breakingCurrentPage: breakingCurrentPage ?? this.breakingCurrentPage,
      hasMoreBreaking: hasMoreBreaking ?? this.hasMoreBreaking,
      isBreakingMoreLoading:
          isBreakingMoreLoading ?? this.isBreakingMoreLoading,
    );
  }

  @override
  List<Object?> get props => [
        breakingArticles,
        recommendedArticles,
        isBreakingLoading,
        isRecommendedLoading,
        failureMessage,
        breakingCurrentPage,
        isBreakingMoreLoading,
        hasMoreBreaking,
      ];
}
