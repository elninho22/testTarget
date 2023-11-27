import 'package:dartz/dartz.dart';
import 'package:testarget/core/exceptions/exception_generic.dart';
import '../../../saveData/infra/response/response_registers.dart';
import '../../../saveData/infra/response/response_save_register.dart';
import '../../../../core/exceptions/failure.dart';
import '../../infra/response/response_delete_register.dart';
import '../repositories/save_data_repository.dart';
import './save_data_usecase.dart';

class SaveDataUsecaseImpl implements SaveDataUsecase {
  final SaveDataRepository repository;

  SaveDataUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, ResponseRegisters>> findAllRegisterUsecase() {
    return repository.findAllRegisterRepository();
  }

  @override
  Future<Either<Failure, ResponseSaveRegister>> saveRegisterUsecase(
      List<String> parameters) async {
    if (parameters.isEmpty) {
      return left(
        ExceptionGeneric(
          message: 'Preencha o campo antes de salvar',
          path: 'SaveDataUsecaseImpl',
        ),
      );
    }
    return repository.saveRegisterRepository(parameters);
  }
  
  @override
  Future<Either<Failure, ResponseDeleteRegister>> deleteRegisterUsecase() {
    return repository.deleteRegisterRepository();
  }
}
