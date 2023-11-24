import '../models/save_data_entity_extends.dart';

class ResponseSaveData {
  final SaveDataEntityExtends? data;
  final String? message;
  final int? statusCode;

  ResponseSaveData({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseSaveData.fromMap({
    dynamic response,
    int? statusCode,
    String? message,
  }) {
    return ResponseSaveData(
      data: response != null ? SaveDataEntityExtends.fromMap(response) : null,
      message: message,
      statusCode: statusCode,
    );
  }
}
