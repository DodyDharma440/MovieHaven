import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  LoginPage({super.key});

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
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please sign in to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white38,
                      ),
                    ),
                    const SizedBox(height: 50),
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
                      errorText: _formKey.currentState?.errors['password'],
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.password()
                      ]),
                    ),
                    const SizedBox(height: 32),
                    Button(
                      text: "Sign In",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/register");
                          },
                          child: Text(
                            "Sign Up",
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
