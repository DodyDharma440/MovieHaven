import 'package:flutter/material.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionList(
      title: "Trending",
      child: Text("List here..."),
    );
  }
}
