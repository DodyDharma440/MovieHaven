import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/views/explore_page.dart';
import 'package:movie_haven/app/modules/Favourites/views/favourites_page.dart';
import 'package:movie_haven/app/modules/Home/views/home_page.dart';
import 'package:movie_haven/app/modules/Settings/views/settings_page.dart';

enum TabPage { home, explore, favourites, settings }

extension TabPageExtension on TabPage {
  int get value {
    switch (this) {
      case TabPage.home:
        return 0;
      case TabPage.explore:
        return 1;
      case TabPage.favourites:
        return 2;
      case TabPage.settings:
        return 3;
    }
  }
}

class MainLayoutController extends GetxController {
  static MainLayoutController get instance {
    if (!Get.isRegistered<MainLayoutController>()) {
      Get.put(MainLayoutController());
    }
    return Get.find<MainLayoutController>();
  }

  late PageController pageController;

  RxInt activePage = 0.obs;

  List<Widget> pages = [
    HomePage(),
    ExplorePage(),
    FavouritesPage(),
    SettingsPage(),
  ];

  void goToPage(TabPage name) {
    activePage.value = name.value;
    pageController.jumpToPage(name.value);
  }

  void animateToTab(int page) {
    activePage.value = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
