import 'package:flutter_modular/flutter_modular.dart';
import 'package:testarget/features/splash/presenter/pages/splash_page.dart';
import '../../core/local_storages/local_storage.dart';
import 'presenter/store/splash_store.dart';

class ModuleSplash extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => SplashStore(
        shared: i.get<LocalStorage>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
  ];
}
