

import '../parameters/parameters_save_data.dart';

abstract class SaveDataDatasource {
  Future<void> call(ParametersSaveData parameters);
}
