import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Settings/controllers/account_controller.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final _controller = AccountController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account settings"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              FormBuilder(
                key: _controller.accountFormKey,
                child: SectionList(
                  title: "Account information",
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      TextInput(
                        name: "name",
                        label: "Name",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      TextInput(
                        name: "email",
                        label: "Email",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email()
                        ]),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Button(
                          onPressed: () {
                            var isValid = _controller
                                    .accountFormKey.currentState
                                    ?.validate() ??
                                false;
                            if (isValid) {
                              var name = _controller.accountFormKey.currentState
                                      ?.instantValue['name'] ??
                                  "";
                              var email = _controller.accountFormKey
                                      .currentState?.instantValue['email'] ??
                                  "";
                              _controller.updateProfile(name, email);
                            }
                          },
                          text: "Update profile",
                          isLoading: _controller.isLoadingProfile.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.white30),
              const SizedBox(height: 24),
              FormBuilder(
                key: _controller.passwordFormKey,
                child: GetBuilder<AccountController>(
                  builder: (controller) => SectionList(
                    title: "Change password",
                    child: Column(
                      children: controller.showUpdatePassword.value
                          ? [
                              const SizedBox(height: 6),
                              TextInput(
                                key: const Key("password"),
                                name: "password",
                                label: "Password",
                                isPassword: true,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.password()
                                ]),
                              ),
                              const SizedBox(height: 16),
                              TextInput(
                                name: "confirmPassword",
                                label: "Confirm Password",
                                isPassword: true,
                                errorText: controller.accountFormKey
                                    .currentState?.errors['confirmPassword'],
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.equal(
                                      controller.accountFormKey.currentState
                                              ?.fields['password']?.value ??
                                          "",
                                      errorText:
                                          "Confirm password is not equal to password",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Button(
                                onPressed: () {
                                  var value = _controller
                                          .passwordFormKey
                                          .currentState
                                          ?.instantValue['password'] ??
                                      "";

                                  _controller.updatePassword(
                                    value,
                                  );
                                },
                                text: "Update password",
                                isLoading: controller.isLoadingPassword.value,
                              )
                            ]
                          : [
                              const SizedBox(height: 6),
                              TextInput(
                                key: const Key("currentPassword"),
                                name: "currentPassword",
                                label: "Current password",
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                isPassword: true,
                              ),
                              const SizedBox(height: 20),
                              Button(
                                onPressed: () {
                                  var isValid = _controller
                                          .passwordFormKey.currentState
                                          ?.validate() ??
                                      false;
                                  var value = _controller
                                          .passwordFormKey
                                          .currentState
                                          ?.instantValue['currentPassword'] ??
                                      "";

                                  if (isValid) {
                                    _controller.checkPassword(
                                      value,
                                    );
                                  }
                                },
                                text: "Check password",
                                isLoading: controller.isLoadingPassword.value,
                              ),
                            ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
