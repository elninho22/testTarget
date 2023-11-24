import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/features/user/presenter/pages/user_page.dart';

import '../../core/rest_client/rest_client.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/user_usecase.dart';
import 'domain/usecases/user_usecase_impl.dart';
import 'external/datasource/user_datasource_impl.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repository/user_repository_impl.dart';
import 'presenter/store/user_store.dart';

class ModuleUser extends Module {
  @override
  final List<Bind> binds = [
    //DATASOURCE
    Bind.lazySingleton<UserDatasource>(
      (i) => UserDatasourceImpl(i.get<RestClient>()),
    ),
    //REPOSITORY
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(
        i.get<UserDatasource>(),
      ),
    ),
    //USECASE
    Bind.lazySingleton<UserUsecase>(
      (i) => UserUsecaseImpl(
        i.get<UserRepository>(),
      ),  
    ),
    //CONTROLLER
    Bind.lazySingleton(
      (i) => UserStore(
        userUsecase: i(),
      ),
    ),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const AuthPage(),
    ),
  ];
}
