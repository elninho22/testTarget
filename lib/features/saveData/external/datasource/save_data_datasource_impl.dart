import 'dart:convert';

import 'package:testarget/core/local_storages/const_strings.dart';
import 'package:testarget/core/local_storages/local_storage.dart';
import 'package:testarget/features/saveData/infra/response/response_registers.dart';
import 'package:testarget/features/saveData/infra/response/response_save_register.dart';

import '../../../../core/exceptions/exception_generic.dart';
import '../../infra/datasources/save_data_datasource.dart';
import '../../infra/parameters/register_entity.dart';

class SaveDataDatasourceImpl implements SaveDataDatasource {
  final LocalStorage _shared;
  SaveDataDatasourceImpl(this._shared);

  @override
  Future<ResponseRegisters> findAllRegisterDatasource() async {
    try {
      List<String>? resp = await _prepareFindDataStorage();
      return ResponseRegisters.fromMap(
        response: resp,
        statusCode: resp != null ? 200 : 404,
        message:
            resp != null ? 'Lista dos registros' : 'Nenhum resgitro encontrado',
      );
    } catch (e) {
      throw ExceptionGeneric(
        error: e.toString(),
        message: 'Problema para listar os registros',
        path: 'SaveDataDatasourceImpl(findAllRegisterDatasource)',
      );
    }
  }

  @override
  Future<ResponseSaveRegister> saveRegisterDatasource(
      RegisterEntity parameters) async {
    try {
      bool resp = await _prepareSaveDataStorage(parameters);
      return ResponseSaveRegister.fromMap(
        response: resp,
        statusCode: resp ? 200 : 500,
        message: resp ? 'Registro salvo' : 'Problema para salvar o registro',
      );
    } catch (e) {
      throw ExceptionGeneric(
        error: e.toString(),
        message: 'Problema para salvar os registros',
        path: 'SaveDataDatasourceImpl(findAllRegisterDatasource)',
      );
    }
  }

  Future<List<String>?> _prepareFindDataStorage() async {
    List<String>? result = await _shared.read(ConstStrings.USERDATA);
    if (result == null) return null;
    return result;
  }

  Future<bool> _prepareSaveDataStorage(RegisterEntity parameters) async {
    try {
      List<String> dataOld = <String>[];
      List<String>? result = await _prepareFindDataStorage();
      dataOld.add(jsonEncode(parameters.toMap()));

      if (result != null) {
        dataOld.addAll(result);
        await _shared.remove(ConstStrings.USERDATA);
      }

      await _shared.write(ConstStrings.USERDATA, dataOld);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteRegisterDatasource() async {
    try {
      bool? result = await _shared.contains(ConstStrings.USERDATA);
      return result;
    } catch (e) {
      throw ExceptionGeneric(
        error: e.toString(),
        message: 'Problema para deletar os registros',
        path: 'SaveDataDatasourceImpl(deleteRegisterDatasource)',
      );
    }
  }
}
