import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/lang/app_translation.dart';
import '../../domain/repositories/save_data_repository.dart';
import '../datasources/save_data_datasource.dart';
import '../parameters/parameters_save_data.dart';

class SaveDataRepositoryImpl implements SaveDataRepository {
  final SaveDataDatasource datasource;

  SaveDataRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, void>> call(
     ParametersSaveData parameters) async {
    try {
      final result = await datasource(parameters);
      return right(result);
    } catch (e) {
      return left(Failure(message: AppTranslationString.string('error')));
    }
  }
}
