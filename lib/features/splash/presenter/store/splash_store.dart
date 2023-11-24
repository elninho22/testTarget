import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/local_storages/local_storage.dart';
import '../../../../core/routes/app_routes.dart';

class SplashStore  {
  final LocalStorage shared;

  SplashStore({
    required this.shared,
  });


  redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.navigate(AppRoutes.user);
  }
}
