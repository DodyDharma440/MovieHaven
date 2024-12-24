import 'package:movie_haven/app/modules/Home/routes/home_routes.dart';

class Config {
  static String appName = "Movie Haven";
  static String homePath = HomeRoutes.home;

  static String tmdbImageUrl(String path, [String? width]) {
    return "http://image.tmdb.org/t/p/w${width ?? "300"}$path";
  }
}
