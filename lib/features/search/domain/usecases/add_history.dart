import 'dart:async';
import 'package:clean_news_app/features/search/domain/repositories/discover_repo.dart';
import 'package:dartz/dartz.dart';

class AddToHistoryUsecase {
  final DiscoverRepo repo;
  AddToHistoryUsecase(this.repo);
  Future<Either<String ,List<String>>> call(String query) async {
    return repo.addToHistory(query);
  }
}
