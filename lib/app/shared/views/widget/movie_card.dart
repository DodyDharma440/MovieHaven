import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Movie/routes/movie_routes.dart';
import 'package:movie_haven/config/config.dart';

class MovieCard extends StatelessWidget {
  final MovieModel item;
  final double? cardWidth;
  final double cardHeight;
  final bool largerText;

  const MovieCard({
    super.key,
    required this.item,
    this.cardWidth = 150,
    this.cardHeight = 250,
    this.largerText = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Map<String, dynamic> args = {
          "id": item.id,
          "title": item.title,
          "imagePath": item.posterPath,
        };
        Get.toNamed(
          MovieRoutes.movieDetail,
          arguments: args,
          preventDuplicates: false,
        );
      },
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
              padding: EdgeInsets.symmetric(horizontal: largerText ? 6 : 2),
              child: Column(
                children: [
                  SizedBox(height: largerText ? 3 : 1),
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
                  SizedBox(height: largerText ? 3 : 1),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: largerText ? 16 : 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${item.voteAverage.toStringAsFixed(1)} (${item.voteCount}${largerText ? " reviews" : ""})",
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
  }
}
