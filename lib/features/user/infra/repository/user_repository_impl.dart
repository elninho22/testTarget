import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/lang/app_translation.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';
import '../response/response_user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ResponseUser>> saveUser(
      Map<String, dynamic> parameters) async {
    try {
      final result = await datasource.saveUserDatasource(parameters);
      return right(result);
    } catch (e) {
      return left(Failure(message: AppTranslationString.string('error')));
    }
  }
}
