
import 'failure.dart';

class ExceptionGeneric implements Failure {
  @override
  final String message;
  final int statusCode;
  final String? path;
  final dynamic error;

  ExceptionGeneric({required this.message, this.path, this.statusCode = 1001, this.error});

  @override
  String toString() {
    return '''
              ExceptionGeneric:
              path: $path 
              message: $message 
              statusCode: $statusCode
              error: $error
            ''';
  }
}
