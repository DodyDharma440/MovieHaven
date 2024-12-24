import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/services/app_auth_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

abstract class AuthService extends BaseService {
  static AuthService get instance {
    if (!Get.isRegistered<AuthService>()) {
      Get.lazyPut<AuthService>(() => AppAuthService());
    }
    return Get.find<AuthService>();
  }

  Future<UserCredential> login({required Map<String, dynamic> body});

  Future<UserCredential> register({required Map<String, dynamic> body});
}
