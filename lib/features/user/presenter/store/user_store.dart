// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:testarget/core/routes/app_routes.dart';
import 'package:testarget/features/user/domain/usecases/user_usecase.dart';
import 'package:testarget/features/user/infra/response/response_user.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/exceptions/exception_generic.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/rest_client/rest_client_exception.dart';
import '../../infra/parameters/parameters_user.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final UserUsecase _userUsecase;
  _UserStoreBase({required UserUsecase userUsecase})
      : _userUsecase = userUsecase;

  @observable
  bool isLoading = false;

  @action
  Future<void> initLoading() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }

  @action
  showLoading(bool value) {
    isLoading = value;
  }

  Future<void> launchInBrowser(String url) async {
    var urlNew = Uri.parse(url);

    if (!await launchUrl(
      urlNew,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $urlNew');
    }
  }

  loginUser({required ParametersUser parameters}) async =>
      _loginUser(parameters: parameters);

  _loginUser({required ParametersUser parameters}) async {
    try {
      initLoading().then((value) => Modular.to.pushNamed(AppRoutes.user));

      //SIMULATION CONNECT API REQUEST LOGIN USER
      showLoading(true);
      Either<Failure, ResponseUser> response =
          await _userUsecase.saveUserUseCase(parameters.toMap());
      var result = response.fold(
        (l) {
          if (l is ExceptionGeneric) {}
          if (l is RestClientException) {}
          return null;
        },
        (r) {
          showLoading(false);
          if (r.data != null) Modular.to.pushNamed(AppRoutes.splash);
        },
      );
      return result;
    } catch (e) {
      showLoading(false);
      debugPrint('$e');
    }
  }
}
