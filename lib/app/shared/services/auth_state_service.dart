import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/services/app_auth_state_service.dart';

abstract class AuthStateService {
  static AuthStateService get instance {
    if (!Get.isRegistered<AuthStateService>()) {
      Get.lazyPut<AuthStateService>(() => AppAuthStateService());
    }
    return Get.find<AuthStateService>();
  }

  User? getUser();

  bool? getIsLogin();

  void setIsLogin();
}
