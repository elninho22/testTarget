import '../../../../core/rest_client/rest_client.dart';
import '../../../../core/rest_client/rest_client_exception.dart';
import '../../infra/datasources/user_datasource.dart';
import '../../infra/response/response_user.dart';

class UserDatasourceImpl implements UserDatasource {
  final RestClient _network;
  UserDatasourceImpl(this._network);

  @override
  Future<ResponseUser> saveUserDatasource(Map<String, dynamic> parameters) async {
    try {

        final resp = await _network.post(
          '',
          data: parameters,
        );
        return ResponseUser.fromMap(
          response: resp.data,
          statusCode: resp.statusCode,
          message: resp.statusMessage,
        );
      
    } on RestClientException catch (e) {
      return ResponseUser.fromMap(
          response: e.response?.data,
          statusCode: e.statusCode,
          message: e.message);
    
  }
  }
}
