import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/services/app_favourites_service.dart';

abstract class FavouritesService {
  static FavouritesService get instance {
    if (!Get.isRegistered<FavouritesService>()) {
      Get.lazyPut<FavouritesService>(() => AppFavouritesService());
    }
    return Get.find<FavouritesService>();
  }

  Future<List<MovieModel>> getFavourites();

  Future<bool> getFavourite(int movieId);

  Future<void> addFavourite(MovieModel movie);

  Future<void> removeFavourite(int movieId);
}
