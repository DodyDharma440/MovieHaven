import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Explore/services/explore_service.dart';
import 'package:movie_haven/app/shared/controllers/paginated_controller.dart';

enum MovieType {
  popular,
  topRated,
  trending,
  upcoming,
}

class SearchController extends PaginatedController {
  static SearchController get instance {
    if (!Get.isRegistered<SearchController>()) {
      Get.put(SearchController());
    }
    return Get.find<SearchController>();
  }

  List<MovieModel> movies = [];
  RxString query = "".obs;

  final formKey = GlobalKey<FormBuilderState>();

  final _exploreService = ExploreService.instance;

  @override
  void onInit() {
    super.onInit();
    query.value = Get.arguments;
    getMovies(Get.arguments, 1);

    0.5.delay(
      () => formKey.currentState?.fields['search']?.didChange(Get.arguments),
    );

    ever(page, (value) {
      getMovies(query.value, value);
    });

    ever(query, (value) {
      getMovies(value, 1);
    });
  }

  void getMovies(String query, int page) async {
    startLoading();
    try {
      final response = await _exploreService.searchMovies(query, page);
      movies = response.results;
      totalPage.value = response.totalPages;
      update();
      stopLoading();
    } catch (e) {
      setErrorMessage();
      stopLoading();
    }
  }

  void onSearch(String value) {
    query.value = value;
    page.value = 1;
    update();
  }
}
