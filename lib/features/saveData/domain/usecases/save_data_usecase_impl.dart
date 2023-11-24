import 'package:dartz/dartz.dart';
import 'package:testarget/core/exceptions/exception_generic.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/lang/app_translation.dart';
import '../../infra/parameters/parameters_save_data.dart';
import '../repositories/save_data_repository.dart';
import 'save_data_usecase.dart';

class SaveDataUsecaseImpl implements SaveDataUsecase {
  final SaveDataRepository repository;

  SaveDataUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(
      ParametersSaveData parameters) async {
    try {
      if (parameters.text == '') {
        return left(
          ExceptionGeneric(
            message: 'Parameters Invalid',
            path: 'SaveDataUsecaseImpl',
          ),
        );
      }
      return repository(parameters);
    } catch (e) {
      return left(Failure(message: AppTranslationString.string('error')));
    }
  }
}
