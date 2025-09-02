
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<ArticleEntity> breakingArticles;
  final List<ArticleEntity> recommendedArticles;
  NewsLoadedState({required this.breakingArticles, required this.recommendedArticles});

  @override
  List<Object?> get props => [breakingArticles, recommendedArticles];
}

class NewsErrorState extends NewsState {
  final String failureMessage;
  NewsErrorState({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}