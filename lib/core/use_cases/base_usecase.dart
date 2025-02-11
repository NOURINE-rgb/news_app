import 'package:clean_news_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}

class HeadlineArticleParameters extends Equatable {
  const HeadlineArticleParameters(
      {required this.category, required this.country});
  final String country;
  final String category;
  @override
  List<Object?> get props => [country, category];
}

class AllArticleParameters extends Equatable {
  const AllArticleParameters({required this.query, required this.sortedBY});
  final String query;
  final String sortedBY;

  @override
  List<Object?> get props => [query, sortedBY];
}

