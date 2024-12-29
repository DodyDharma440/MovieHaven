import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/controllers/search_controller.dart'
    as search_ctrl;
import 'package:movie_haven/app/shared/views/widget/paginated_movies_grid.dart';
import 'package:movie_haven/app/shared/views/widget/text_input.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search movies"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<search_ctrl.SearchController>(
          init: search_ctrl.SearchController.instance,
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                FormBuilder(
                  key: controller.formKey,
                  child: TextInput(
                    name: "search",
                    label: "Search...",
                    onSubmitted: (value) {
                      if (value != null) controller.onSearch(value);
                    },
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      "Search results for ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "'${controller.query.value}'",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PaginatedMoviesGrid(
                  controller: controller,
                  movies: controller.movies,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
