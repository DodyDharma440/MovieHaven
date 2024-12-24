import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppHomeService extends BaseService implements HomeService {
  @override
  Future<PaginationModel<MovieModel>> getPopularMovies() async {
    final res = await apiTmdb.get('/movie/popular');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getTopRatedMovies() async {
    final res = await apiTmdb.get('/movie/top_rated');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getTrendingMovies() async {
    final res = await apiTmdb.get('/trending/movie/week');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getUpcomingMovies() async {
    final res = await apiTmdb.get('/movie/upcoming');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }
}
