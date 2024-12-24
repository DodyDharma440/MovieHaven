import 'package:flutter/material.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionList(
      title: "Top rated",
      child: Text("List here..."),
    );
  }
}
