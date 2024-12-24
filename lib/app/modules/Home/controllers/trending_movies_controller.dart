import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/controllers/movies_list_controller.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';

class TrendingMoviesController extends MoviesListController {
  static TrendingMoviesController get instance {
    if (!Get.isRegistered<TrendingMoviesController>()) {
      Get.put(TrendingMoviesController());
    }
    return Get.find<TrendingMoviesController>();
  }

  HomeService homeService = HomeService.instance;

  @override
  Future<PaginationModel<MovieModel>> getMoviesService() {
    return homeService.getTrendingMovies();
  }
}
