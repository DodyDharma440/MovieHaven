import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/services/favourites_service.dart';
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
  RxBool isFavorite = false.obs;

  final _movieService = MovieService.instance;
  final _favouritesService = FavouritesService.instance;

  @override
  void onInit() {
    super.onInit();

    getMovie();
    getFavourite();
  }

  void getFavourite() async {
    try {
      int id = Get.arguments['id'];
      isFavorite.value = await _favouritesService.getFavourite(id);
      update();
    } catch (e) {
      print(e);
    }
  }

  RxBool isLoadingToggle = false.obs;

  void toggleFavorite(bool currentValue) async {
    bool oldValue = currentValue;
    isFavorite.value = !currentValue;
    isLoadingToggle.value = true;
    update();

    try {
      if (movie != null) {
        if (currentValue) {
          await _favouritesService.removeFavourite(movie?.id ?? 0);
        } else {
          await _favouritesService.addFavourite(movie!);
        }
      }
      Get.snackbar(
        "Success",
        !currentValue ? "Added to favourites!" : "Removed from favorites",
      );
      isLoadingToggle.value = false;
      update();
    } catch (e) {
      isFavorite.value = oldValue;
      isLoadingToggle.value = false;
      update();
      Get.snackbar("Error", "Something is wrong");
    }
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
