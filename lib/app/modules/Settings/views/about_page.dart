import 'package:flutter/material.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                SectionList(
                  title: "Developer profile",
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/images/dodi.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Dodi Aditya",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 24,
                          ),
                          child: Column(
                            children: [
                              _profileItem(
                                label: "Name",
                                value: "I Made Dodi Aditya Ari Dharma",
                                context: context,
                              ),
                              _profileItem(
                                label: "Profession",
                                value: "Frontend Developer",
                                context: context,
                              ),
                              _profileItem(
                                label: "Email",
                                value: "dodiaridharma@gmail.com",
                                context: context,
                              ),
                              _profileItem(
                                label: "Github",
                                value: "DodyDharma440",
                                context: context,
                              ),
                              _profileItem(
                                label: "LinkedIn",
                                value: "dodi-aditya-237154206",
                                context: context,
                                isLast: true,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SectionList(
                  title: "About this app",
                  child: Column(
                    children: [
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus convallis efficitur euismod. Etiam vestibulum massa eget tellus tincidunt, eu aliquet nulla fermentum. Sed fermentum nulla eget arcu facilisis commodo at ut neque. Mauris eget cursus ligula. Morbi id velit eu neque mollis pharetra. Nunc metus metus, ultrices vel eros a, hendrerit maximus purus.",
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Movie",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Haven",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const Text("v 1.0.0"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileItem({
    required String label,
    required String value,
    required BuildContext context,
    bool isLast = false,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          !isLast
              ? const Padding(
                  padding: EdgeInsets.only(
                    top: 4,
                    bottom: 6,
                  ),
                  child: Divider(
                    color: Colors.white12,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
