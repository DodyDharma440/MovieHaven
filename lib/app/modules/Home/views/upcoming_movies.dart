import 'package:flutter/material.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionList(
      title: "Upcoming",
      child: Text("List here..."),
    );
  }
}
