import '../parameters/register_entity.dart';
import '../response/response_registers.dart';
import '../response/response_save_register.dart';

abstract class SaveDataDatasource {
  Future<ResponseSaveRegister> saveRegisterDatasource(
      RegisterEntity parameters);
  Future<ResponseRegisters> findAllRegisterDatasource();
  Future<bool> deleteRegisterDatasource();
}
