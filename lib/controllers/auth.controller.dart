import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage box = GetStorage();
  String get authToken => box.read('authToken') ?? '';

  void saveToken(final String authToken) {
    box.write('authToken', authToken);
  }

  void wipeToken() {
    box.write('authToken', '');
  }
}
