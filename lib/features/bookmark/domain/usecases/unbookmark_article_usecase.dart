import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/article.dart';
import '../repositories/bookmark_repo.dart';

class RemoveBookmarkUseCase {
  final BookmarkRepo _repository;

  RemoveBookmarkUseCase(this._repository);

  Future<Either<String, void>> call(ArticleEntity article) async {
    return await _repository.unBookmarkArticle(article);
  }
}