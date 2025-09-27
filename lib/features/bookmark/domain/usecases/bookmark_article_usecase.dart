import 'package:clean_news_app/features/bookmark/domain/repositories/bookmark_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/shared/entities/article.dart';

class BookmarkArticleUseCase {
  final BookmarkRepo _repository;
  BookmarkArticleUseCase(this._repository);

  Future<Either<String, void>> call(ArticleEntity article) async {
    return await _repository.bookmarkArticle(article);
  }
}