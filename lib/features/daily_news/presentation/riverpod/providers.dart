import 'package:clean_news_app/core/constants/constants_var.dart';
import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/core/use_cases/base_usecase.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_breaking_news_article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_wallstreet_article.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWallStreetProvider =
    FutureProvider<Either<Failure, List<ArticleEntity>>>(
  (ref) async {
    final useCase = sl<GetWallStreetArticleUseCase>();
    return await useCase.call();
  },
);

final getBreakingNewsProvider =
    FutureProvider<Either<Failure, List<ArticleEntity>>>(
  (ref) async {
    final useCase = sl<GetBreakingNewsArticleUseCase>();
    return await useCase.call(
      params: AllArticleParameters(
          query: "breaking news", sortedBY: ConstantsVar.relevancy),
    );
  },
);
