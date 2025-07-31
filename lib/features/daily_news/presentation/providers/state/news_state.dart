
import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<ArticleEntity> articles;
  NewsLoadedState({required this.articles});

  @override
  List<Object?> get props => [articles];
}

class NewsErrorState extends NewsState {
  final Failure failure;
  NewsErrorState({required this.failure});

  @override
  List<Object?> get props => [failure];
}