import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';
import 'package:movie_haven/app/shared/controllers/get_data.dart';

class PopularMoviesController extends GetData {
  static PopularMoviesController get instance {
    if (!Get.isRegistered<PopularMoviesController>()) {
      Get.put(PopularMoviesController());
    }
    return Get.find<PopularMoviesController>();
  }

  HomeService homeService = HomeService.instance;

  List<MovieModel> movies = [];

  @override
  void onInit() {
    super.onInit();
    getMovies();
  }

  void getMovies() async {
    startLoading();
    try {
      final response = await homeService.getPopularMovies();
      movies = response.results;
      update();
      stopLoading();
    } catch (e) {
      print(e);
      setErrorMessage();
      stopLoading();
    }
  }
}
