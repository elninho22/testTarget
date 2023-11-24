// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/widgets.dart';

import 'helpers.dart';

class FactoryValidators {
  FactoryValidators._();

  static FormFieldValidator required({String m = 'requiredField'}) {
    String _m = Helpers.stringTranslated(m);
    return (v) {
      if (v?.isEmpty ?? true) return _m;
      return null;
    };
  }

  static FormFieldValidator<String> min(int min,
      {String m = 'valor informado é menor que'}) {
    String _m = Helpers.stringTranslated(m);
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) < min) return _m;
      return null;
    };
  }

  static FormFieldValidator<String> max(int max,
      {String m = 'valor informado é maior que'}) {
    String _m = Helpers.stringTranslated(m);
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) > max) return _m;
      return null;
    };
  }


  static FormFieldValidator<String> email({String m = 'mailValid'}) {
    String _m = Helpers.stringTranslated(m);
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (validatorRegex.email(v!)) return null;
      return _m;
    };
  }
  static FormFieldValidator<String> validPassword({String m = 'passValid'}) {
    String _m = Helpers.stringTranslated(m);
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (!validatorRegex.validPassword(v!)) return null;
      return _m;
    };
  }

  static FormFieldValidator<String> multiple(
      List<FormFieldValidator<String>> v) {
    return (value) {
      for (final validator in v) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}

const validatorRegex = _Validator();

final RegExp _emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

final RegExp _formatPasswordReges = RegExp(r"[$&+,:;=?@#|'~<>.^*()%!]");

class _Validator {
  const _Validator();

  bool email(String input) => _emailRegex.hasMatch(input);
  bool validPassword(String input) => _formatPasswordReges.hasMatch(input);
}
