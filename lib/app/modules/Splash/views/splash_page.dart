import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/get-started.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Movie",
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Haven",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices posuere velit, non mattis enim dignissim eu. Etiam vel dolor elit. Cras mattis vestibulum urna consequat posuere.",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    Button(
                      text: "Get Started",
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
