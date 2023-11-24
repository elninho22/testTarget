// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/usecases/save_data_usecase.dart';
import '../../infra/parameters/parameters_save_data.dart';



part 'save_data_store.g.dart';

class SaveDataStore = _SaveDataStoreBase with _$SaveDataStore;

abstract class _SaveDataStoreBase with Store {
  final SaveDataUsecase _saveUsecase;
  _SaveDataStoreBase({required SaveDataUsecase saveDataUsecase})
      : _saveUsecase = saveDataUsecase;

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

  saveDataUser({required ParametersSaveData parameters}) async =>
      _saveDataUser(parameters: parameters);

  _saveDataUser({required ParametersSaveData parameters}) async {
    try {
      showLoading(true);
     await _saveUsecase(parameters);
      showLoading(false);
    } catch (e) {
      showLoading(false);
      debugPrint('$e');
    }
  }
}
