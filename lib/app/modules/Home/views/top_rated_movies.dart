import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Home/controllers/top_rated_movies_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionList(
      title: "Top rated",
      titlePadding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetBuilder<TopRatedMoviesController>(
          init: TopRatedMoviesController.instance,
          builder: (controller) {
            return HorizontalMoviesList(movies: controller.movies);
          }),
    );
  }
}
