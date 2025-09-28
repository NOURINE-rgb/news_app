import 'dart:async';
import 'package:clean_news_app/features/search/domain/repositories/discover_repo.dart';
import 'package:dartz/dartz.dart';

class GetHistorySearchUsecase {
  final DiscoverRepo repo;
  GetHistorySearchUsecase(this.repo);
  Future<Either<String ,List<String>>> call() async {
    return repo.getHisotrySearch();
  }
}
