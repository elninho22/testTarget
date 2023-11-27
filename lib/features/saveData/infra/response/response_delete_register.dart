class ResponseDeleteRegister {
  final dynamic data;
  final String? message;
  final int? statusCode;

  ResponseDeleteRegister({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseDeleteRegister.fromMap({
    dynamic response,
    int? statusCode,
    String? message,
  }) {
    return ResponseDeleteRegister(
      data: response,
      message: message,
      statusCode: statusCode,
    );
  }
}