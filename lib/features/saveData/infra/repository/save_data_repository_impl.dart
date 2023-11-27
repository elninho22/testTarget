import 'package:dartz/dartz.dart';
import '../../../saveData/infra/response/response_registers.dart';
import '../../../saveData/infra/response/response_save_register.dart';
import '../../../../core/exceptions/exception_generic.dart';
import '../../../../core/exceptions/failure.dart';
import '../../domain/repositories/save_data_repository.dart';
import '../datasources/save_data_datasource.dart';
import '../parameters/register_entity.dart';

class SaveDataRepositoryImpl implements SaveDataRepository {
  final SaveDataDatasource datasource;

  SaveDataRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ResponseRegisters>> findAllRegisterRepository() async {
    try {
      final result = await datasource.findAllRegisterDatasource();
      return Right(result);
    } catch (e) {
      return Left(
        ExceptionGeneric(
          error: e,
          message: e.toString(),
          path: 'SaveDataRepositoryImpl(findAllRegisterRepository)',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseSaveRegister>> saveRegisterRepository(
      RegisterEntity parameters) async {
    try {
      final result = await datasource.saveRegisterDatasource(parameters);
      return Right(result);
    } catch (e) {
      return Left(
        ExceptionGeneric(
          error: e,
          message: e.toString(),
          path: 'SaveDataRepositoryImpl(saveRegisterRepository)',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteRegisterRepository() async {
    try {
      final result = await datasource.deleteRegisterDatasource();
      return Right(result);
    } catch (e) {
      return Left(
        ExceptionGeneric(
          error: e,
          message: e.toString(),
          path: 'SaveDataRepositoryImpl(deleteRegisterRepository)',
        ),
      );
    }
  }
}
