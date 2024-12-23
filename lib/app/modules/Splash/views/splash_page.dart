import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Splash page"),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/login");
            },
            child: const Text("LOGIN"),
          )
        ],
      ),
    );
  }
}
