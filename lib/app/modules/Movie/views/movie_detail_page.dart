import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Movie/controller/movie_detail_controller.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({super.key});

  final controller = MovieDetailController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Detail"),
      ),
      body: GetBuilder<MovieDetailController>(
        builder: (controller) => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(controller.movie?.title ?? ""),
      ),
    );
  }
}
