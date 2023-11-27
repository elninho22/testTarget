import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/response/response_delete_register.dart';
import '../../infra/response/response_registers.dart';
import '../../infra/response/response_save_register.dart';

abstract class SaveDataRepository {
  Future<Either<Failure, ResponseSaveRegister>> saveRegisterRepository(List<String> parameters);
  Future<Either<Failure, ResponseRegisters>> findAllRegisterRepository();
  Future<Either<Failure, ResponseDeleteRegister>> deleteRegisterRepository();
}
