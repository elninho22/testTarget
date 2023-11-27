class ResponseSaveRegister {
  final dynamic data;
  final String? message;
  final int? statusCode;

  ResponseSaveRegister({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseSaveRegister.fromMap({
    dynamic response,
    int? statusCode,
    String? message,
  }) {
    return ResponseSaveRegister(
      data: response,
      message: message,
      statusCode: statusCode,
    );
  }
}
