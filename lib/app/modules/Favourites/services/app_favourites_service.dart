import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/services/favourites_service.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/config/firestore_names.dart';

class AppFavouritesService implements FavouritesService {
  final _db = FirebaseFirestore.instance;
  final _authState = AuthState.instance;

  @override
  Future<void> addFavourite(MovieModel movie) async {
    await _db
        .collection(FirestoreNames.favourites)
        .doc(_authState.userData?.uid)
        .collection(FirestoreNames.movies)
        .doc("${movie.id}")
        .set(movie.toJsonFavourite());
  }

  @override
  Future<bool> getFavourite(int movieId) async {
    final res = await _db
        .collection(FirestoreNames.favourites)
        .doc(_authState.userData?.uid)
        .collection(FirestoreNames.movies)
        .where('id', isEqualTo: movieId)
        .get();
    return res.docs.isNotEmpty;
  }

  @override
  Future<List<MovieModel>> getFavourites() async {
    final res = await _db
        .collection(FirestoreNames.favourites)
        .doc(_authState.userData?.uid)
        .collection(FirestoreNames.movies)
        .get();

    List<MovieModel> movies = res.docs
        .map<MovieModel>((el) => MovieModel.fromJson(el.data()))
        .toList();

    return movies;
  }

  @override
  Future<void> removeFavourite(int movieId) async {
    await _db
        .collection(FirestoreNames.favourites)
        .doc(_authState.userData?.uid)
        .collection(FirestoreNames.movies)
        .doc("$movieId")
        .delete();
  }
}
