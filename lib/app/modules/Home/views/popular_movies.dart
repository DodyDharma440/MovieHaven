import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Home/controllers/popular_movies_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionList(
      title: "Popular",
      titlePadding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetBuilder<PopularMoviesController>(
          init: PopularMoviesController.instance,
          builder: (controller) {
            return HorizontalMoviesList(movies: controller.movies);
          }),
    );
  }
}
