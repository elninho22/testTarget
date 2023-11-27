import 'package:testarget/features/user/infra/parameters/parameters_user.dart';



class ResponseUser {
  final ParametersUser? data;
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
      data: response != null ? ParametersUser.fromMap(response) : null,
      message: message,
      statusCode: statusCode,
    );
  }
}
