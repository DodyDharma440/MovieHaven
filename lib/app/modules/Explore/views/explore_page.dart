import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/controllers/explore_controller.dart';
import 'package:movie_haven/app/modules/Explore/routes/explore_routes.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/paginated_movies_grid.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

List<Map<String, dynamic>> filters = [
  {"label": "Trending", "value": MovieType.trending},
  {"label": "Popular", "value": MovieType.popular},
  {"label": "Upcoming", "value": MovieType.upcoming},
  {"label": "Top rated", "value": MovieType.topRated},
];

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final controller = ExploreController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextInput(
              name: "search",
              label: "Search movies...",
              isCompact: true,
              prefixIcon: const Icon(Icons.search),
              onSubmitted: (value) {
                Get.toNamed(ExploreRoutes.search, arguments: value);
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 52,
                  child: GetBuilder<ExploreController>(builder: (controller) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(filters.length, (index) {
                        var item = filters[index];
                        var isActive = item['value'] == controller.type.value;

                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 24 : 0,
                            right: index == filters.length - 1 ? 24 : 16,
                          ),
                          child: Button(
                            onPressed: () {
                              controller.setType(
                                item['value'],
                              );
                            },
                            variant: isActive
                                ? ButtonVariant.filled
                                : ButtonVariant.outline,
                            text: item['label'],
                            width: null,
                            horizontalPadding: 30,
                            isCompact: true,
                          ),
                        );
                      }),
                    );
                  }),
                ),
                GetBuilder<ExploreController>(
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.all(24),
                    child: PaginatedMoviesGrid(
                      controller: controller,
                      movies: controller.movies,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
