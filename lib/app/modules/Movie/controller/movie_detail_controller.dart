import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Movie/services/movie_service.dart';
import 'package:movie_haven/app/shared/controllers/get_data.dart';

class MovieDetailController extends GetData {
  static MovieDetailController get instance {
    if (!Get.isRegistered<MovieDetailController>()) {
      Get.put(MovieDetailController());
    }
    return Get.find<MovieDetailController>();
  }

  MovieModel? movie;

  final _movieService = MovieService.instance;

  @override
  void onInit() {
    super.onInit();
    getMovie();
  }

  void getMovie() async {
    int id = Get.arguments;
    startLoading();
    try {
      final response = await _movieService.getDetailMovie(id);
      movie = response;
      update();
      stopLoading();
    } catch (e) {
      print(e);
      setErrorMessage();
      stopLoading();
    }
  }
}
