import '../models/user_entity_extends.dart';

class ResponseUser {
  final UserExtends? data;
  final String? message;
  final int? statusCode;

  ResponseUser({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseUser.fromMap({
    dynamic response,
    int? statusCode,
    String? message,
  }) {
    return ResponseUser(
      data: response != null ? UserExtends.fromMap(response) : null,
      message: message,
      statusCode: statusCode,
    );
  }
}
