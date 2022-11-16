import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxString _authToken = ''.obs;
  String get authToken => _authToken.value;

  void saveToken(final String authToken) {
    _authToken.value = authToken;
  }

  void wipeToken() {
    _authToken.value = '';
  }
}
