
import 'package:flutter_modular/flutter_modular.dart';

import '../local_storages/local_storage.dart';
import '../local_storages/shared_preferences_local_storage_impl.dart';
import '../rest_client/dio_rest_client.dart';
import '../rest_client/rest_client.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(), export: true),
    Bind.factory<RestClient>(
        (i) => DioRestClient(
              localStorage: i<LocalStorage>()
            ),
        export: true),
  ];
}
