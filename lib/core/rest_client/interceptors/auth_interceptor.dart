import 'package:dio/dio.dart';
import '../../local_storages/local_storage.dart';
import '../rest_client.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required LocalStorage localStorage,
    required RestClient restClient,
  });

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {}
}
