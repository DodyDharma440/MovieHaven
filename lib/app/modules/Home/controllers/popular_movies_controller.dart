import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/controllers/movies_list_controller.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';

class PopularMoviesController extends MoviesListController {
  static PopularMoviesController get instance {
    if (!Get.isRegistered<PopularMoviesController>()) {
      Get.put(PopularMoviesController());
    }
    return Get.find<PopularMoviesController>();
  }

  HomeService homeService = HomeService.instance;

  @override
  Future<PaginationModel<MovieModel>> getMoviesService() {
    return homeService.getPopularMovies();
  }
}
