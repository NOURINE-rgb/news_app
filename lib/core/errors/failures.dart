abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
