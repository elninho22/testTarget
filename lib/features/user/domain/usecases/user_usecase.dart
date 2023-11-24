import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/response/response_user.dart';


abstract class UserUsecase {
  Future<Either<Failure, ResponseUser>> saveUserUseCase(
      Map<String, dynamic> parameters);
}
