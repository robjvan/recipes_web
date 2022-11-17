import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en': <String, String>{'app-title': 'Recipes'},
        'fr': <String, String>{'app-title': 'Recipes'},
        'es': <String, String>{'app-title': 'Recipes'},
      };
}
