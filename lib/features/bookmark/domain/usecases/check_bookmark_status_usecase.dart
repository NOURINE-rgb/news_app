import '../repositories/bookmark_repo.dart';

class CheckBookmarkStatusUseCase {
  final BookmarkRepo _repository;

  CheckBookmarkStatusUseCase(this._repository);

  Future<bool> call(String url) async {
    return await _repository.isArticleBookmarked(url);
  }
}