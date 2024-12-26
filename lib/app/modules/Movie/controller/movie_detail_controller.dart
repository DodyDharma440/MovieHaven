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
  List<MovieModel> recommendations = [];

  final _movieService = MovieService.instance;

  @override
  void onInit() {
    super.onInit();

    getMovie();
  }

  void getMovie() async {
    int id = Get.arguments['id'];
    startLoading();
    try {
      final response = await _movieService.getDetailMovie(id);
      final resRec = await _movieService.getRecommendationMovies(id);
      movie = response;
      recommendations = resRec.results;

      update();
      stopLoading();
    } catch (e) {
      setErrorMessage();
      stopLoading();
    }
  }
}
