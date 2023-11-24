// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/local_storages/local_storage.dart';
import '../../../../core/routes/app_routes.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final LocalStorage shared;
  _SplashStoreBase(this.shared);

  redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.navigate(AppRoutes.user);
  }
}
