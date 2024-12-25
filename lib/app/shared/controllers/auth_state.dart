import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/routes/auth_routes.dart';
import 'package:movie_haven/app/modules/Splash/routes/splash_routes.dart';
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
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        await 0.5.delay(() {
          if (Get.currentRoute != SplashRoutes.splash &&
              Get.currentRoute != AuthRoutes.login &&
              Get.currentRoute != AuthRoutes.register) {
            signOut();
          }
        });

        resetUserData();
      } else {
        setUserData(user: user);
      }
    });

    super.onInit();
  }

  void setIsLogin() {
    _authStateService.setIsLogin();
  }

  void setUserData({User? user}) {
    isAuthenticated.value = true;
    userData = user ?? _authStateService.getUser();
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
