import 'package:flutter/material.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/config/config.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieModel> movies;
  final double cardWidth;
  final double cardHeight;
  final bool largerText;

  const HorizontalMoviesList(
      {super.key,
      required this.movies,
      this.cardWidth = 200,
      this.cardHeight = 300,
      this.largerText = false});

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
              left: index == 0 ? 32 : 0,
              right: index == movies.length - 1 ? 32 : 16,
            ),
            child: SizedBox(
              width: cardWidth,
              child: Column(
                children: [
                  Container(
                    height: cardHeight,
                    width: cardWidth,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          Config.tmdbImageUrl(item.posterPath),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: largerText ? 6 : 2),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            item.title,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: largerText ? 18 : 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: largerText ? 16 : 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${item.voteAverage.toStringAsFixed(1)} (${item.voteCount})",
                              style: TextStyle(
                                fontSize: largerText ? 14 : 12,
                                color: Colors.white54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
