import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/services/auth_service.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  final AuthService _authService = AuthService.instance;
  final formKey = GlobalKey<FormBuilderState>(
    debugLabel: "GlobalFormKey #SignIn",
  );

  RxBool isLoading = false.obs;

  Future<void> handleSubmit() async {
    isLoading.value = true;
    update();

    try {
      var userData = await _authService.login(body: {
        "email": formKey.currentState?.instantValue['email'],
        "password": formKey.currentState?.instantValue['password'],
      });
      print(userData);
      isLoading.value = false;
      update();
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
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      update();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      update();
    }
  }
}
