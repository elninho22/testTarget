import '../response/response_delete_register.dart';
import '../response/response_registers.dart';
import '../response/response_save_register.dart';

abstract class SaveDataDatasource {
  Future<ResponseSaveRegister> saveRegisterDatasource(
      List<String> parameters);
  Future<ResponseRegisters> findAllRegisterDatasource();
  Future<ResponseDeleteRegister> deleteRegisterDatasource();
}
