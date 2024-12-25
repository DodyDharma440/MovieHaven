import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Settings/services/settings_service.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';

class AccountController extends GetxController {
  static AccountController get instance {
    if (!Get.isRegistered<AccountController>()) {
      Get.put(AccountController());
    }
    return Get.find<AccountController>();
  }

  final accountFormKey = GlobalKey<FormBuilderState>(
    debugLabel: "GlobalFormKey #AccountForm",
  );
  final passwordFormKey = GlobalKey<FormBuilderState>(
    debugLabel: "GlobalFormKey #PasswordForm",
  );

  RxBool showUpdatePassword = false.obs;
  RxBool isLoadingProfile = false.obs;
  RxBool isLoadingPassword = false.obs;

  final _settingsService = SettingsService.instance;
  final _authState = AuthState.instance;

  @override
  void onInit() async {
    super.onInit();

    await 0.5.delay(() => setDefaultValue());
  }

  void setDefaultValue() {
    accountFormKey.currentState?.fields['name']
        ?.didChange(_authState.userData?.displayName);
    accountFormKey.currentState?.fields['email']
        ?.didChange(_authState.userData?.email);
  }

  void checkPassword(String password) async {
    isLoadingPassword.value = true;
    update();
    try {
      await _settingsService.checkPassword(password);
      showUpdatePassword.value = true;
      isLoadingPassword.value = false;
      update();
    } catch (e) {
      Get.snackbar("Error", "Password incorrect");
      isLoadingPassword.value = false;
      update();
    }
  }

  void updatePassword(String password) async {
    isLoadingPassword.value = true;
    update();
    try {
      await _settingsService.updatePassword(password);
      _authState.signOut();
      Get.snackbar("Success", "Update password complete. Please re-login");
      isLoadingPassword.value = false;
      update();
    } catch (e) {
      Get.snackbar("Error", "Something is wrong when updating the password");
      isLoadingPassword.value = false;
      update();
    }
  }

  void updateProfile(String name, String email) async {
    isLoadingProfile.value = true;
    update();
    try {
      await _settingsService.updateProfile(
        name: name,
        email: email,
        emailCallback: () {
          Get.snackbar(
            "Info",
            "Please check your email to verify and relogin with new email. The email will be not changed until verification is complete.",
          );
        },
      );
      Get.snackbar(
        "Info",
        "Update profile success",
      );
      isLoadingProfile.value = false;
      update();
    } catch (e) {
      Get.snackbar("Error", "Something is wrong when updating the profile");
      isLoadingProfile.value = false;
      update();
    }
  }
}
