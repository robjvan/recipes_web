import 'package:get/get.dart';
import 'package:recipes_web/utils/localization/en.dart';
import 'package:recipes_web/utils/localization/es.dart';
import 'package:recipes_web/utils/localization/fr.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en': englishStrings,
        'fr': frenchStrings,
        'es': spanishStrings,
      };
}
