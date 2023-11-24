import 'dart:convert';

import 'package:testarget/core/local_storages/const_strings.dart';
import 'package:testarget/core/local_storages/local_storage.dart';

import '../../infra/datasources/save_data_datasource.dart';
import '../../infra/parameters/parameters_save_data.dart';

class SaveDataDatasourceImpl implements SaveDataDatasource {
  final LocalStorage _shared;
  SaveDataDatasourceImpl(this._shared);

  @override
  Future<void> call(ParametersSaveData parameters) async {
    // print('sp ${parameters.text}');
    bool? check = await _shared.contains(ConstStrings.USERDATA);
    List<String> dataList = [];
    if (check == true) {

      List<String>? list = await _shared.read(ConstStrings.USERDATA);
      dataList.add(jsonEncode(parameters.toJson()));

      dataList.addAll(list!);

      await _shared.remove(ConstStrings.USERDATA);


      await _shared.write(ConstStrings.USERDATA, dataList);

        List<String>? sp2 = await _shared.read(
      ConstStrings.USERDATA,
    );
      
    } else {
      dataList.add(jsonEncode(parameters.toJson()));
      await _shared.write(ConstStrings.USERDATA, dataList);
    }
  }
}
