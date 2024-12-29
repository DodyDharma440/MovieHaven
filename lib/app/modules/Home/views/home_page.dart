import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/routes/explore_routes.dart';
import 'package:movie_haven/app/modules/Home/views/popular_movies.dart';
import 'package:movie_haven/app/modules/Home/views/top_rated_movies.dart';
import 'package:movie_haven/app/modules/Home/views/trending_movies.dart';
import 'package:movie_haven/app/modules/Home/views/upcoming_movies.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/app/shared/controllers/main_layout_controller.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _authState = AuthState.instance;
  final _layoutController = MainLayoutController.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white12,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 26,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, ${_authState.userData?.displayName?.split(" ")[0] ?? ""}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                "Find your favourite movies!",
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            _layoutController.goToPage(TabPage.settings);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(
                                Icons.settings,
                                size: 24,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextInput(
                      name: "search",
                      label: "Search movies...",
                      onSubmitted: (value) {
                        Get.toNamed(ExploreRoutes.search, arguments: value);
                      },
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TrendingMovies(),
              const SizedBox(height: 28),
              PopularMovies(),
              const SizedBox(height: 28),
              UpcomingMovies(),
              const SizedBox(height: 28),
              TopRatedMovies(),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
