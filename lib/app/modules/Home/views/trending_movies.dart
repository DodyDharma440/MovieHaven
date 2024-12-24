import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Home/controllers/trending_movies_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({super.key});

  final controller = TrendingMoviesController.instance;

  @override
  Widget build(BuildContext context) {
    return SectionList(
      title: "Trending",
      titlePadding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetBuilder<TrendingMoviesController>(
        builder: (controller) {
          return HorizontalMoviesList(
            movies: controller.movies,
            cardWidth: 300,
            cardHeight: 200,
            largerText: true,
          );
        },
      ),
    );
  }
}
