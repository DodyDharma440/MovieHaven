import 'package:get/get.dart';
import 'package:movie_haven/app/shared/controllers/auth_check.dart';

class SplashController extends AuthCheck {
  static SplashController get instance {
    if (!Get.isRegistered<SplashController>()) Get.put(SplashController());
    return Get.find<SplashController>();
  }
}
