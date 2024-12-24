import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/controllers/register_controller.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController registerController = Get.put(
    RegisterController.instance,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: FormBuilder(
                key: registerController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Create a new account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please fill all the form to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white38,
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextInput(
                      name: "name",
                      label: "Full Name",
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
                    const SizedBox(height: 16),
                    TextInput(
                      name: "password",
                      label: "Password",
                      isPassword: true,
                      errorText: registerController
                          .formKey.currentState?.errors['password'],
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
                      errorText: registerController
                          .formKey.currentState?.errors['confirmPassword'],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.equal(
                          registerController.formKey.currentState
                                  ?.fields['password']?.value ??
                              "",
                          errorText:
                              "Confirm password is not equal to password",
                        ),
                      ]),
                    ),
                    const SizedBox(height: 32),
                    Obx(
                      () => Button(
                        text: "Sign Up",
                        isLoading: registerController.isLoading.value,
                        onPressed: () {
                          registerController.handleSubmit();
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account? "),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed("/login");
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
