import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Explore/services/explore_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppExploreService extends BaseService implements ExploreService {
  @override
  Future<PaginationModel<MovieModel>> searchMovies(String query,
      [int? page]) async {
    final res = await apiTmdb.get(
      '/search/movie?query=$query&page=${page ?? 1}',
    );
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }
}
