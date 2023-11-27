import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/helpers/alert_asuka.dart';
import '../../domain/usecases/save_data_usecase.dart';
import '../../infra/parameters/register_entity.dart';
import '../../infra/response/response_registers.dart';
import '../../infra/response/response_save_register.dart';

part 'save_data_store.g.dart';

class SaveDataStore = _SaveDataStoreBase with _$SaveDataStore;

abstract class _SaveDataStoreBase with Store {
  final SaveDataUsecase _usecase;
  _SaveDataStoreBase({required SaveDataUsecase saveDataUsecase})
      : _usecase = saveDataUsecase;

  @observable
  bool isLoading = false;

  @observable
  bool isEdit = false;

  @observable
  int indexEdit = 999999999;

  @observable
  ObservableList<RegisterEntity> listRegisters =
      <RegisterEntity>[].asObservable();

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

  Future<void> allRegisters() async {
    listRegisters.clear();
    showLoading(true);
    List<RegisterEntity>? result = await _allRegisters();
    if (result != null) {
      listRegisters.addAll(result);
    }
    await Future.delayed(const Duration(milliseconds: 300));
    showLoading(false);
  }

  Future<List<RegisterEntity>?> _allRegisters() async {
    try {
      Either<Failure, ResponseRegisters> response =
          await _usecase.findAllRegisterUsecase();
      List<RegisterEntity>? result = response.fold((l) {
        AlertAsuka.warning('Problema para listar os registros');
        return null;
      }, (r) => r.data);
      return result;
    } catch (e) {
      return null;
    }
  }

  newRegister({
    required RegisterEntity parameters,
  }) async {
    showLoading(true);
    bool result = await _newRegister(parameters);
    if (result) {
      AlertAsuka.success('Registro salvo');
      RegisterEntity element = RegisterEntity(
        content: parameters.content,
        createdAt: parameters.createdAt,
      );
      listRegisters.add(element);
    }
    await Future.delayed(const Duration(milliseconds: 300));
    showLoading(false);
  }

  Future<bool> _newRegister(RegisterEntity parameters) async {
    try {
      Either<Failure, ResponseSaveRegister> response =
          await _usecase.saveRegisterUsecase(parameters);
      bool result = response.fold((l) {
        AlertAsuka.warning('Problema para listar os registros');
        return false;
      }, (r) {
        if (r.data == null || r.statusCode == 500) return false;
        return true;
      });
      return result;
    } catch (e) {
      return false;
    }
  }

  removeItem(int index) async {
    List<RegisterEntity> listOld = [];
    listOld.addAll(listRegisters);
    listOld.removeAt(index);
    await Future.delayed(const Duration(milliseconds: 300));
    bool? result = await _deleteRegister();
    if (result == true) {
      listRegisters.clear();
      listRegisters.addAll(listOld);  

          //  await _usecase.saveRegisterUsecase();
    }
  }

  @action
  setIndex(int index) {
    isEdit = true;
    indexEdit = index;
  }

  @action
  editItem(RegisterEntity paramters) async {
    showLoading(true);
    List<RegisterEntity> listOld = [];
    listOld.addAll(listRegisters);
    listOld.removeAt(indexEdit);
    listOld.insert(indexEdit, paramters);

    await Future.delayed(const Duration(milliseconds: 300));
    bool? result = await _deleteRegister();
    if (result == true) {
      listRegisters.clear();
      listRegisters.addAll(listOld);
    }

    isEdit = false;
    showLoading(false);
  }

  Future<bool> _deleteRegister() async {
    try {
      Either<Failure, bool> response = await _usecase.deleteRegisterUsecase();
      bool result = response.fold((l) {
        AlertAsuka.warning('Problema para deletar o registro');
        return false;
      }, (r) {
        return r;
      });
      return result;
    } catch (e) {
      return false;
    }
  }
}
