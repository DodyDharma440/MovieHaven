import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/services/auth_service.dart';
import 'package:movie_haven/app/shared/controllers/auth_check.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/config/config.dart';

class RegisterController extends AuthCheck {
  static RegisterController get instance {
    if (!Get.isRegistered<RegisterController>()) Get.put(RegisterController());
    return Get.find<RegisterController>();
  }

  @override
  void onInit() {
    if (AuthState.instance.isAuthenticated.isTrue) {
      Get.offNamed(Config.homePath);
    }
    super.onInit();
  }

  final AuthService _authService = AuthService.instance;
  final formKey = GlobalKey<FormBuilderState>(
    debugLabel: "GlobalFormKey #Register",
  );

  final AuthState _authState = AuthState.instance;

  RxBool isLoading = false.obs;

  Future<void> handleSubmit() async {
    isLoading.value = true;
    update();

    try {
      var userData = await _authService.register(body: {
        "email": formKey.currentState?.instantValue['email'],
        "password": formKey.currentState?.instantValue['password'],
      });
      await userData.user?.updateDisplayName(
        formKey.currentState?.instantValue['name'],
      );
      isLoading.value = false;

      _authState.setIsLogin();
      _authState.setUserData();

      update();

      Get.snackbar(
        "Success",
        "Register success",
      );
      Get.offAllNamed(Config.homePath);
    } on FirebaseAuthException catch (e) {
      var message = "";
      if (e.code == 'email-already-in-use') {
        message = 'Email already in use.';
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
