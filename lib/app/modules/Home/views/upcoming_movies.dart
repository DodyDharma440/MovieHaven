import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Home/controllers/upcoming_movies_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class UpcomingMovies extends StatelessWidget {
  UpcomingMovies({super.key});

  final controller = UpcomingMoviesController.instance;

  @override
  Widget build(BuildContext context) {
    return SectionList(
      title: "Upcoming",
      titlePadding: const EdgeInsets.symmetric(horizontal: 32),
      child: GetBuilder<UpcomingMoviesController>(builder: (controller) {
        return HorizontalMoviesList(movies: controller.movies);
      }),
    );
  }
}
