import 'package:get/get.dart';
import 'package:movie_haven/config/config.dart';

import 'auth_state.dart';

class AuthCheck extends GetxController {
  final AuthState auth = AuthState.instance;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    redirect();
  }

  void redirect() async {
    if (auth.isAuthenticated.isTrue) {
      isLoading.value = true;
      await 1.delay(() => Get.offAllNamed(Config.homePath));
    }
  }
}
