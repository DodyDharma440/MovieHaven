import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/services/auth_state_service.dart';
import 'package:movie_haven/routes/routes.dart';

class AuthState extends GetxController {
  static AuthState get instance {
    if (!Get.isRegistered<AuthState>()) Get.put(AuthState());
    return Get.find<AuthState>();
  }

  final _authStateService = AuthStateService.instance;

  RxBool isAuthenticated = false.obs;
  User? userData;

  @override
  void onInit() {
    var userStorage = _authStateService.getIsLogin();
    isAuthenticated.value = userStorage == true;
    userData = _authStateService.getUser();

    super.onInit();
  }

  void setIsLogin() {
    _authStateService.setIsLogin();
  }

  void setUserData() {
    isAuthenticated.value = true;
    userData = _authStateService.getUser();
  }

  void resetUserData() {
    isAuthenticated.value = false;
    userData = null;
  }

  void signOut() async {
    await _authStateService.signOut();
    resetUserData();
    Get.offAllNamed(Routes.splash);
  }
}
