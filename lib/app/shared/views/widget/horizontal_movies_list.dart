import 'package:flutter/material.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/config/config.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const HorizontalMoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
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
              width: 200,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 200,
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
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      item.title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${item.voteAverage.toStringAsFixed(1)} (${item.voteCount})",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                          ),
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
