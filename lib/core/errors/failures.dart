import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
