import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Explore/services/app_explore_service.dart';

abstract class ExploreService {
  static ExploreService get instance {
    if (!Get.isRegistered<ExploreService>()) {
      Get.lazyPut<ExploreService>(() => AppExploreService());
    }
    return Get.find<ExploreService>();
  }

  Future<PaginationModel<MovieModel>> searchMovies(String query, [int? page]);
}
