import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/services/favourites_service.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/app/shared/controllers/get_data.dart';
import 'package:movie_haven/config/firestore_names.dart';

class FavouriteController extends GetData {
  static FavouriteController get instance {
    if (!Get.isRegistered<FavouriteController>()) {
      Get.put(FavouriteController());
    }
    return Get.find<FavouriteController>();
  }

  List<MovieModel> movies = [];

  final _favouriteService = FavouritesService.instance;
  final _db = FirebaseFirestore.instance;
  final _authState = AuthState.instance;

  Stream<QuerySnapshot>? moviesStream;

  @override
  void onInit() {
    super.onInit();
    getMovies();
    onListen();

    moviesStream = _db
        .collection(FirestoreNames.favourites)
        .doc(_authState.userData?.uid)
        .collection(FirestoreNames.movies)
        .snapshots();
    update();
  }

  void onListen() {
    final docRef = _db.collection(FirestoreNames.favourites).doc(
          _authState.userData?.uid,
        );
    docRef.snapshots().listen((event) {});
  }

  void getMovies() async {
    startLoading();
    try {
      final response = await _favouriteService.getFavourites();
      movies = response;
      update();
      stopLoading();
    } catch (e) {
      setErrorMessage();
      stopLoading();
    }
  }
}
