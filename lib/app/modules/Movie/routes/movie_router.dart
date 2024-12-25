import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_haven/app/modules/Movie/routes/movie_routes.dart';
import 'package:movie_haven/app/modules/Movie/views/movie_detail_page.dart';

List<GetPage> movieRoutes = [
  GetPage(name: MovieRoutes.movieDetail, page: () => MovieDetailPage())
];
