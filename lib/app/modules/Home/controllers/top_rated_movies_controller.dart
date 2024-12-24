import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/controllers/movies_list_controller.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';

class TopRatedMoviesController extends MoviesListController {
  static TopRatedMoviesController get instance {
    if (!Get.isRegistered<TopRatedMoviesController>()) {
      Get.put(TopRatedMoviesController());
    }
    return Get.find<TopRatedMoviesController>();
  }

  HomeService homeService = HomeService.instance;

  @override
  Future<PaginationModel<MovieModel>> getMoviesService() {
    return homeService.getTopRatedMovies();
  }
}
