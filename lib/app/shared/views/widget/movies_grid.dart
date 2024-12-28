import 'package:flutter/material.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/shared/views/widget/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return movies.isNotEmpty
        ? GridView.builder(
            itemCount: movies.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 310,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
            itemBuilder: (_, index) {
              var item = movies[index];
              return MovieCard(
                item: item,
                cardWidth: null,
              );
            },
          )
        : const SizedBox(
            height: 100,
            child: Center(
              child: Text("No movies yet"),
            ),
          );
  }
}
