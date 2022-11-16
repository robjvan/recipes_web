import 'package:get/get.dart';

class ApiStateController extends GetxController {
  RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  void setLoadingState(bool loadingState) {
    _isLoading.value = loadingState;
  }
}
