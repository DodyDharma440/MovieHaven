import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Movie/services/movie_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppMovieService extends BaseService implements MovieService {
  @override
  Future<MovieModel> getDetailMovie(int id) async {
    final res = await apiTmdb.get('/movie/$id');
    return MovieModel.fromJson(res.data);
  }

  @override
  Future<PaginationModel<MovieModel>> getRecommendationMovies(int id) async {
    final res = await apiTmdb.get('/movie/$id/recommendations');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }
}
