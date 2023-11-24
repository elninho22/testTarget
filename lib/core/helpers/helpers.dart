import 'package:flutter/material.dart';

import '../lang/translation_service.dart';

class Helpers {
  Helpers._();

  static bool isNullOrEmpty(String? value,
      {bool considerWhiteSpaceAsEmpty = false}) {
    RegExp emptyRegex = RegExp(r'^\s*$');
    if (considerWhiteSpaceAsEmpty) {
      return value == null || emptyRegex.hasMatch(value);
    }
    return value?.isEmpty ?? true;
  }

    static String stringTranslated(String? text) {
    if (text == '' || text == null) return '';
    return TranslationService.tr(text.trim());
  }

  static void focus(
      BuildContext context, FocusNode unfocus, FocusNode nextFocus) {
    unfocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static unfocusForm(BuildContext context) {
    try {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    } on Exception catch (e, s) {
      debugPrint("$e $s");
    }
  }
}
