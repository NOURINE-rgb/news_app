import 'package:clean_news_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';


abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}



