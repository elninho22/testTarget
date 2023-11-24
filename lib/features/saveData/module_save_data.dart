import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/features/saveData/presenter/pages/save_data_page.dart';
import '../../core/rest_client/rest_client.dart';
import 'domain/repositories/save_data_repository.dart';
import 'domain/usecases/save_data_usecase.dart';
import 'domain/usecases/save_data_usecase_impl.dart';
import 'external/datasource/save_data_datasource_impl.dart';
import 'infra/datasources/save_data_datasource.dart';
import 'infra/repository/save_data_repository_impl.dart';
import 'presenter/store/save_data_store.dart';

class ModuleSaveData extends Module {
  @override
  final List<Bind> binds = [
    //DATASOURCE
    Bind.lazySingleton<SaveDataDatasource>(
      (i) => SaveDataDatasourceImpl(i()),
    ),
    //REPOSITORY
    Bind.lazySingleton<SaveDataRepository>(
      (i) => SaveDataRepositoryImpl(
        i.get<SaveDataDatasource>(),
      ),
    ),
    //USECASE
    Bind.lazySingleton<SaveDataUsecase>(
      (i) => SaveDataUsecaseImpl(
        i.get<SaveDataRepository>(),
      ),  
    ),
    //CONTROLLER
    Bind.lazySingleton(
      (i) => SaveDataStore(
        saveDataUsecase: i(),
      ),
    ),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SaveDataPage(),
    ),
  ];
}
