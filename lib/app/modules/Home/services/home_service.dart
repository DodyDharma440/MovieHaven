import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/services/app_home_service.dart';

abstract class HomeService {
  static HomeService get instance {
    if (!Get.isRegistered<HomeService>()) {
      Get.lazyPut<HomeService>(() => AppHomeService());
    }
    return Get.find<HomeService>();
  }

  Future<PaginationModel<MovieModel>> getTrendingMovies([int? page]);

  Future<PaginationModel<MovieModel>> getPopularMovies([int? page]);

  Future<PaginationModel<MovieModel>> getTopRatedMovies([int? page]);

  Future<PaginationModel<MovieModel>> getUpcomingMovies([int? page]);
}
