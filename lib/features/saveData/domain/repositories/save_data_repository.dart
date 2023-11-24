import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/parameters/parameters_save_data.dart';

abstract class SaveDataRepository {
  Future<Either<Failure, void>> call(
      ParametersSaveData parameters);
}
