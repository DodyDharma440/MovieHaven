import 'package:flutter/material.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/shared/controllers/paginated_controller.dart';
import 'package:movie_haven/app/shared/views/widget/button.dart';
import 'package:movie_haven/app/shared/views/widget/movies_grid.dart';

class PaginatedMoviesGrid extends StatelessWidget {
  final PaginatedController controller;
  final List<MovieModel> movies;

  const PaginatedMoviesGrid({
    super.key,
    required this.controller,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.isLoading.value
            ? const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : MoviesGrid(
                movies: movies,
              ),
        Row(
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
        )
      ],
    );
  }
}
