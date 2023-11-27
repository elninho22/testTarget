import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/parameters/register_entity.dart';
import '../../infra/response/response_registers.dart';
import '../../infra/response/response_save_register.dart';

abstract class SaveDataUsecase {
  Future<Either<Failure, ResponseSaveRegister>> saveRegisterUsecase(
      RegisterEntity parameters);
  Future<Either<Failure, ResponseRegisters>> findAllRegisterUsecase();
  Future<Either<Failure, bool>> deleteRegisterUsecase();
}
