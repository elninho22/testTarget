import 'package:dartz/dartz.dart';
import 'package:testarget/core/exceptions/exception_generic.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/lang/app_translation.dart';
import '../../infra/response/response_user.dart';
import '../repositories/user_repository.dart';
import 'user_usecase.dart';

class UserUsecaseImpl implements UserUsecase {
  final UserRepository repository;

  UserUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, ResponseUser>> saveUserUseCase(
      Map<String, dynamic> parameters) async {
    try {
      if (parameters.isEmpty) {
        return left(
          ExceptionGeneric(
            message: 'Parameters Invalid',
            path: 'UserUsecaseImpl',
          ),
        );
      }
      return repository.saveUser(parameters);
    } catch (e) {
      return left(Failure(message: AppTranslationString.string('error')));
    }
  }
}
