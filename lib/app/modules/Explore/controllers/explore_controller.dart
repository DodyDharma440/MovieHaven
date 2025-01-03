import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';
import 'package:movie_haven/app/shared/controllers/paginated_controller.dart';

enum MovieType {
  popular,
  topRated,
  trending,
  upcoming,
}

class ExploreController extends PaginatedController {
  static ExploreController get instance {
    if (!Get.isRegistered<ExploreController>()) {
      Get.put(ExploreController());
    }
    return Get.find<ExploreController>();
  }

  Rx<MovieType> type = MovieType.trending.obs;
  List<MovieModel> movies = [];

  final _homeService = HomeService.instance;

  @override
  void onInit() {
    super.onInit();
    getMovies(1);

    ever(type, (value) {
      getMovies(1);
    });

    ever(page, (value) {
      getMovies(value);
    });
  }

  Future<PaginationModel<MovieModel>> getMoviesData(int page) {
    switch (type.value) {
      case MovieType.trending:
        return _homeService.getTrendingMovies(page);
      case MovieType.topRated:
        return _homeService.getTopRatedMovies(page);
      case MovieType.popular:
        return _homeService.getPopularMovies(page);
      case MovieType.upcoming:
        return _homeService.getUpcomingMovies(page);
    }
  }

  void getMovies(int page) async {
    startLoading();
    try {
      final response = await getMoviesData(page);
      movies = response.results;
      totalPage.value = response.totalPages;
      update();
      stopLoading();
    } catch (e) {
      setErrorMessage();
      stopLoading();
    }
  }

  void setType(MovieType value) {
    type.value = value;
    page.value = 1;
    update();
  }
}
