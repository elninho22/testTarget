import 'package:testarget/core/local_storages/const_strings.dart';
import 'package:testarget/core/local_storages/local_storage.dart';

import '../../infra/datasources/save_data_datasource.dart';
import '../../infra/parameters/parameters_save_data.dart';

class SaveDataDatasourceImpl implements SaveDataDatasource {
  final LocalStorage _shared;
  SaveDataDatasourceImpl(this._shared);


  @override
  Future<void> call(ParametersSaveData parameters) async {
    await _shared.write(
      ConstStrings.USERDATA,
      parameters.toJson(),
    );
    
  }
}
