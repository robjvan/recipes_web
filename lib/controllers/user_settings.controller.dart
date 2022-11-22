import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserSettingsController extends GetxController {
  final GetStorage box = GetStorage();

  bool get useDarkMode => box.read('useDarkMode') ?? false;
  ThemeData get theme => useDarkMode ? ThemeData.dark() : ThemeData.light();

  void changeTheme(final bool val) {
    box.write('useDarkMode', val);
  }


  // final RxBool _darkMode = false.obs;
  // bool get darkMode => _darkMode.value;

  // void toggleDarkMode() {
  //   _darkMode.value = !_darkMode.value;
  // }

  // void loadSettingsFromStorage() {
  //   /// Load user settings from SharedPrefs, apply to local props
  // }
}
