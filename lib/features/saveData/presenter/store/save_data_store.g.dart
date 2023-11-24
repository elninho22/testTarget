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

  late final _$initLoadingAsyncAction =
      AsyncAction('_SaveDataStoreBase.initLoading', context: context);

  @override
  Future<void> initLoading() {
    return _$initLoadingAsyncAction.run(() => super.initLoading());
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
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
