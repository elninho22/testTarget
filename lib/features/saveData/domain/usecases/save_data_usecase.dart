import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/response/response_delete_register.dart';
import '../../infra/response/response_registers.dart';
import '../../infra/response/response_save_register.dart';

abstract class SaveDataUsecase {
  Future<Either<Failure, ResponseSaveRegister>> saveRegisterUsecase(
      List<String> parameters);
  Future<Either<Failure, ResponseRegisters>> findAllRegisterUsecase();
  Future<Either<Failure, ResponseDeleteRegister>> deleteRegisterUsecase();
}
