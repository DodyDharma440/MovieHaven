import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Settings/routes/settings_routes.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/app/shared/views/widget/alert_dialog_content.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';

List<Map<String, dynamic>> settingItems = [
  {
    "icon": Icons.person,
    "title": "My account",
    "description": "Manage and update your profile settings",
    "path": SettingsRoutes.myAccount,
  },
  {
    "icon": Icons.info,
    "title": "About developer",
    "description": "Learn more about the developer from this app.",
    "path": SettingsRoutes.about,
  },
  {
    "icon": Icons.logout,
    "title": "Sign out",
    "description": "Log out your account from this app",
    "path": "_signOut",
  },
];

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final _authState = AuthState.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Movie",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Haven",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...List.generate(
                    settingItems.length,
                    (index) {
                      var item = settingItems[index];

                      return Container(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: InkWell(
                          onTap: () {
                            if (item['path'] == '_signOut') {
                              Get.dialog(
                                AlertDialogContent(
                                  title: "Sign Out",
                                  message: "Are you sure want to sign out?",
                                  action: Column(
                                    children: [
                                      Button(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: "Cancel",
                                        isCompact: true,
                                      ),
                                      const SizedBox(height: 8),
                                      Button(
                                        onPressed: () {
                                          _authState.signOut();
                                        },
                                        text: "Yes, sign out",
                                        variant: ButtonVariant.outline,
                                        isCompact: true,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              Get.toNamed(item['path']);
                            }
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Icon(
                                    item['icon'],
                                    size: 22,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item['description'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            GetPlatform.isWeb == false && GetPlatform.isAndroid ||
                    GetPlatform.isIOS
                ? Button(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    text: "Exit application",
                    variant: ButtonVariant.outline,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
