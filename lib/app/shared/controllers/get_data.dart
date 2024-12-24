import 'package:get/get.dart';

class GetData extends GetxController {
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  void startLoading() {
    isLoading.value = true;
    update();
  }

  void stopLoading() {
    isLoading.value = false;
    update();
  }

  void setErrorMessage() {
    errorMessage?.value = "Something went wrong";
    update();
  }

  bool isError() {
    return errorMessage != null || errorMessage?.value != "";
  }
}
