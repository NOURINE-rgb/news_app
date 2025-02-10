import 'package:clean_news_app/core/errors/failures.dart';
import 'package:clean_news_app/core/service/dependency_injection.dart';
import 'package:clean_news_app/features/daily_news/domain/entities/article.dart';
import 'package:clean_news_app/features/daily_news/domain/use_cases/get_article.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getWallStreetProvider =
    FutureProvider<Either<Failure, List<ArticleEntity>>>(
  (ref) async {
    final useCase = sl<GetArticleUseCase>();
    return await useCase.call();
  },
);
