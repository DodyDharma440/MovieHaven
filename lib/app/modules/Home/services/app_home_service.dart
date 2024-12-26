import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/models/pagination_model.dart';
import 'package:movie_haven/app/modules/Home/services/home_service.dart';
import 'package:movie_haven/app/shared/services/base_service.dart';

class AppHomeService extends BaseService implements HomeService {
  @override
  Future<PaginationModel<MovieModel>> getPopularMovies([int? page]) async {
    final res = await apiTmdb.get('/movie/popular?page=${page ?? 1}');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getTopRatedMovies([int? page]) async {
    final res = await apiTmdb.get('/movie/top_rated?page=${page ?? 1}');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getTrendingMovies([int? page]) async {
    final res = await apiTmdb.get('/trending/movie/week?page=${page ?? 1}');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }

  @override
  Future<PaginationModel<MovieModel>> getUpcomingMovies([int? page]) async {
    final res = await apiTmdb.get('/movie/upcoming?page=${page ?? 1}');
    return PaginationModel<MovieModel>.fromJson(
      res.data,
      (json) => MovieModel.fromJson(json),
    );
  }
}
