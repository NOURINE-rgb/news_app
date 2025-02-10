import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable {
  final String message;
  final String status;
  final String statusCode;
  const ErrorMessage(
      {required this.message, required this.status, required this.statusCode});
  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      message: json["message"],
      status: json["status"],
      statusCode: json["code"],
    );
  }
  
  @override
  List<Object?> get props => [message, status, statusCode];
}
