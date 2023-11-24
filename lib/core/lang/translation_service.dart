import 'package:flutter/material.dart';
import 'package:testarget/core/lang/en_US.dart';
import 'package:testarget/core/lang/pt_BR.dart';

class TranslationService {
  static Locale? get locale => const Locale('pt', 'BR');
  // static final fallbackLocale = Locale('en', 'US');

  static String defaultLanguage = 'pt_BR';

  static Map<String, Map<String, String>> data = {'en_US': en_US, 'pt_BR': pt_BR};

  static set language(String lang) => defaultLanguage = lang;

  static String tr(String kye) => data[defaultLanguage]?[kye] ?? kye;
}
