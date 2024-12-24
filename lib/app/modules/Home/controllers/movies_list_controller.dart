import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/shared/controllers/get_data.dart';

abstract class MoviesListController extends GetData {
  List<MovieModel> movies = [];

  @override
  void onInit() {
    super.onInit();
    getMovies();
  }

  void getMovies() async {
    startLoading();
    try {
      final response = await getMoviesService();
      movies = response.results;
      update();
      stopLoading();
    } catch (e) {
      setErrorMessage();
      stopLoading();
    }
  }

  Future<PaginationModel<MovieModel>> getMoviesService();
}
