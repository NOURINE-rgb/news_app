
import 'package:equatable/equatable.dart';

import '../../../../../../core/shared/entities/article.dart';

class SeeAllState extends Equatable{
  final List<ArticleEntity> articles;
  final bool isLoading;
  final bool hasMore;
  final String? failureMessage;
  final int currentPage;

  const SeeAllState({
    this.articles = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.failureMessage,
    this.currentPage = 1,
  });

  SeeAllState copyWith({
    List<ArticleEntity>? articles,
    bool? isLoading,
    bool? hasMore,
    String? failureMessage,
    int? currentPage,
  }) {
    return SeeAllState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      failureMessage: failureMessage,
      currentPage: currentPage ?? this.currentPage,
    );
  }
  @override
  List<Object?> get props =>[articles, isLoading, hasMore, failureMessage, currentPage];
}