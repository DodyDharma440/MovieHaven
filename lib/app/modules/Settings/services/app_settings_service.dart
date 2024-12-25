import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_haven/app/modules/Settings/services/settings_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppSettingsService extends BaseService implements SettingsService {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Future<void> checkPassword(String currentPassword) async {
    await _user?.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: _user.email ?? "",
        password: currentPassword,
      ),
    );
  }

  @override
  Future<void> updatePassword(String password) async {
    await _user?.updatePassword(password);
  }

  @override
  Future<void> updateProfile({
    required String name,
    required String email,
    required void Function() emailCallback,
  }) async {
    await _user?.updateDisplayName(name);

    bool isEmailChanged = email != _user?.email;
    if (isEmailChanged) {
      await _user?.verifyBeforeUpdateEmail(email);
      emailCallback();
    }
  }
}
