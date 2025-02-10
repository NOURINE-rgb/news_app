import 'package:clean_news_app/core/errors/error_message.dart';

class ServerException implements Exception {
  final ErrorMessage errorMessage;
  const ServerException({required this.errorMessage});
}
