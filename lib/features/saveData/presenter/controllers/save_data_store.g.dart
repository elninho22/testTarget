// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaveDataStore on _SaveDataStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SaveDataStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isEditAtom =
      Atom(name: '_SaveDataStoreBase.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$indexEditAtom =
      Atom(name: '_SaveDataStoreBase.indexEdit', context: context);

  @override
  int get indexEdit {
    _$indexEditAtom.reportRead();
    return super.indexEdit;
  }

  @override
  set indexEdit(int value) {
    _$indexEditAtom.reportWrite(value, super.indexEdit, () {
      super.indexEdit = value;
    });
  }

  late final _$listRegistersAtom =
      Atom(name: '_SaveDataStoreBase.listRegisters', context: context);

  @override
  ObservableList<RegisterEntity> get listRegisters {
    _$listRegistersAtom.reportRead();
    return super.listRegisters;
  }

  @override
  set listRegisters(ObservableList<RegisterEntity> value) {
    _$listRegistersAtom.reportWrite(value, super.listRegisters, () {
      super.listRegisters = value;
    });
  }

  late final _$editItemAsyncAction =
      AsyncAction('_SaveDataStoreBase.editItem', context: context);

  @override
  Future editItem(RegisterEntity paramters) {
    return _$editItemAsyncAction.run(() => super.editItem(paramters));
  }

  late final _$_SaveDataStoreBaseActionController =
      ActionController(name: '_SaveDataStoreBase', context: context);

  @override
  dynamic showLoading(bool value) {
    final _$actionInfo = _$_SaveDataStoreBaseActionController.startAction(
        name: '_SaveDataStoreBase.showLoading');
    try {
      return super.showLoading(value);
    } finally {
      _$_SaveDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int index) {
    final _$actionInfo = _$_SaveDataStoreBaseActionController.startAction(
        name: '_SaveDataStoreBase.setIndex');
    try {
      return super.setIndex(index);
    } finally {
      _$_SaveDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isEdit: ${isEdit},
indexEdit: ${indexEdit},
listRegisters: ${listRegisters}
    ''';
  }
}
