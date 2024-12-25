import 'package:movie_haven/routes/routes.dart';

class Config {
  static String appName = "Movie Haven";
  static String homePath = Routes.main;

  static String tmdbImageUrl(String path, [String? width]) {
    return "http://image.tmdb.org/t/p/w${width ?? "300"}$path";
  }
}
