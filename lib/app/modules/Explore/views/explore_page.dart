import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/controllers/explore_controller.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/movies_grid.dart';
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
        flexibleSpace: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TextInput(
              name: "search",
              label: "Search",
              isCompact: true,
              prefixIcon: Icon(Icons.search),
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
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 200,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : MoviesGrid(
                            movies: controller.movies,
                          ),
                  ),
                ),
                GetBuilder<ExploreController>(
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            onPressed: controller.isCanPrev()
                                ? () {
                                    controller.prevPage();
                                  }
                                : null,
                            text: "Prev",
                            isCompact: true,
                            variant: controller.isCanPrev()
                                ? ButtonVariant.outline
                                : ButtonVariant.filled,
                            width: null,
                          ),
                          Text(
                            "Page ${controller.page} of ${controller.totalPage}",
                          ),
                          Button(
                            onPressed: controller.isCanNext()
                                ? () {
                                    controller.nextPage();
                                  }
                                : null,
                            text: "Next",
                            isCompact: true,
                            variant: controller.isCanNext()
                                ? ButtonVariant.outline
                                : ButtonVariant.filled,
                            width: null,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
