
import 'translation_service.dart';

class AppTranslationString {
  AppTranslationString._();

  static String string(String data) {
    if (data == '' || data.isEmpty) return '';
    return TranslationService.tr(data);
  }
}
