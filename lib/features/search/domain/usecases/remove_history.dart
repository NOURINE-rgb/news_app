import 'dart:async';
import 'package:clean_news_app/features/search/domain/repositories/discover_repo.dart';
import 'package:dartz/dartz.dart';

class RemoveFromHistoryUsecase {
  final DiscoverRepo repo;
  RemoveFromHistoryUsecase(this.repo);
  Future<Either<String ,void>> call(String query) async {
    return await repo.deleteFromHistory(query);
  }
}
