
import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/article.dart';
import '../repositories/bookmark_repo.dart';

class GetBookmarkedArticlesUseCase {
  final BookmarkRepo _repository;

  GetBookmarkedArticlesUseCase(this._repository);

  Future<Either<String,List<ArticleEntity>>> call() async {
    return await _repository.getBookmarkedArticles();
  }
}