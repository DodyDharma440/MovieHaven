import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/services/auth_service.dart';
import 'package:movie_haven/app/shared/controllers/auth_check.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/config/config.dart';

class LoginController extends AuthCheck {
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  @override
  void onInit() {
    if (AuthState.instance.isAuthenticated.isTrue) {
      Get.offAllNamed(Config.homePath);
    }
    super.onInit();
  }

  final AuthService _authService = AuthService.instance;
  final AuthState _authState = AuthState.instance;

  final formKey = GlobalKey<FormBuilderState>(
    debugLabel: "GlobalFormKey #SignIn",
  );

  RxBool isLoading = false.obs;

  Future<void> handleSubmit() async {
    isLoading.value = true;
    update();

    try {
      await _authService.login(body: {
        "email": formKey.currentState?.instantValue['email'],
        "password": formKey.currentState?.instantValue['password'],
      });
      _authState.setIsLogin();
      _authState.setUserData();

      isLoading.value = false;
      update();

      Get.offAllNamed(Config.homePath);
    } on FirebaseAuthException catch (e) {
      var message = "";
      if (e.code == 'user-not-found') {
        message = 'User not found.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong email or password.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong email or password.';
      }
      Get.snackbar(
        "Error",
        message,
      );
      isLoading.value = false;
      update();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
      );
      isLoading.value = false;
      update();
    }
  }
}
