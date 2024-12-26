import 'package:flutter/material.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/shared/views/widget/movie_card.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieModel> movies;
  final double cardWidth;
  final double cardHeight;
  final bool largerText;

  const HorizontalMoviesList({
    super.key,
    required this.movies,
    this.cardWidth = 150,
    this.cardHeight = 250,
    this.largerText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight + 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(movies.length, (index) {
          var item = movies[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == movies.length - 1 ? 24 : 16,
            ),
            child: MovieCard(
              item: item,
              cardHeight: cardHeight,
              cardWidth: cardWidth,
              largerText: largerText,
            ),
          );
        }),
      ),
    );
  }
}
