import 'dart:convert';

import '../parameters/register_entity.dart';

class ResponseRegisters {
  final List<RegisterEntity>? data;
  final String? message;
  final int? statusCode;

  ResponseRegisters({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseRegisters.fromMap({
    List<String>? response,
    int? statusCode,
    String? message,
  }) {
    return ResponseRegisters(
      data: response != null
          ? response.map((e) => RegisterEntity.fromMap(jsonDecode(e))).toList()
          : [],
      message: message,
      statusCode: statusCode,
    );
  }
}
