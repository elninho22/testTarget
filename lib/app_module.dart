
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module/core_module.dart';
import 'features/splash/module_splash.dart';
import 'features/user/module_user.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: ModuleSplash()),
    ModuleRoute('/user', module: ModuleUser()),
  ];
}
