import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_haven/app/shared/services/auth_state_service.dart';

class AppAuthStateService implements AuthStateService {
  final box = GetStorage();
  static const key = "is-login";

  @override
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  bool? getIsLogin() {
    return box.read<bool>(key);
  }

  @override
  void setIsLogin() {
    box.write(key, true);
  }
}
