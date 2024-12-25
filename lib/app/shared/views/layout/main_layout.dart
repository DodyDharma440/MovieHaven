import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/controllers/main_layout_controller.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final _controller = MainLayoutController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  icon: Icons.home,
                  page: TabPage.home,
                  context,
                  label: "Home",
                ),
                _bottomAppBarItem(
                  icon: Icons.explore,
                  page: TabPage.explore,
                  context,
                  label: "Explore",
                ),
                _bottomAppBarItem(
                  icon: Icons.star,
                  page: TabPage.favourites,
                  context,
                  label: "Favorites",
                ),
                _bottomAppBarItem(
                  icon: Icons.settings,
                  page: TabPage.settings,
                  context,
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _controller.animateToTab,
        children: _controller.pages,
      ),
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required icon,
    required TabPage page,
    required label,
  }) {
    var isActive = _controller.activePage.value == page.value;

    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => _controller.goToPage(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.white70,
              size: 24,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
