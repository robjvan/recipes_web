import 'package:get/get.dart';

class ApiStateController extends GetxController {
  // ignore: prefer_final_fields
  RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  void setLoadingState(final bool newLoadingState) {
    _isLoading.value = newLoadingState;
  }
}
