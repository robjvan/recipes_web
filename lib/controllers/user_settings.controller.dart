import 'package:get/get.dart';

class UserSettingsController extends GetxController {
  final RxBool _darkMode = false.obs;
  bool get darkMode => _darkMode.value;
  

  void toggleDarkMode() {
    _darkMode.value = !_darkMode.value;
  }

  void loadSettingsFromStorage() {
    /// Load user settings from SharedPrefs, apply to local props
  }
}
