class ServerException implements Exception {
  final String message;
  const ServerException({required this.message});
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}
