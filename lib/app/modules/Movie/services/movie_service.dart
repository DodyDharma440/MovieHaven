import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Movie/services/app_movie_service.dart';

abstract class MovieService {
  static MovieService get instance {
    if (!Get.isRegistered<MovieService>()) {
      Get.lazyPut<MovieService>(() => AppMovieService());
    }
    return Get.find<MovieService>();
  }

  Future<MovieModel> getDetailMovie(int id);

  Future<PaginationModel<MovieModel>> getRecommendationMovies(int id);
}
