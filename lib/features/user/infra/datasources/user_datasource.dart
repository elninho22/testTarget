

import '../response/response_user.dart';

abstract class UserDatasource {
  Future<ResponseUser> saveUserDatasource(Map<String, dynamic> parameters);
}
