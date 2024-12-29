import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Home/controllers/upcoming_movies_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionList(
      title: "Upcoming",
      titlePadding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetBuilder<UpcomingMoviesController>(
          init: UpcomingMoviesController.instance,
          builder: (controller) {
            return HorizontalMoviesList(movies: controller.movies);
          }),
    );
  }
}
