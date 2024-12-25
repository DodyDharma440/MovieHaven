import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Settings/services/app_settings_service.dart';

abstract class SettingsService {
  static SettingsService get instance {
    if (!Get.isRegistered<SettingsService>()) {
      Get.lazyPut<SettingsService>(() => AppSettingsService());
    }
    return Get.find<SettingsService>();
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required void Function() emailCallback,
  });

  Future<void> checkPassword(String currentPassword);

  Future<void> updatePassword(String password);
}
