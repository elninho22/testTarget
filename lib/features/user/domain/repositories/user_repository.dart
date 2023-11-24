import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/response/response_user.dart';

abstract class UserRepository {
  Future<Either<Failure, ResponseUser>> saveUser(
      Map<String, dynamic> parameters);
}
