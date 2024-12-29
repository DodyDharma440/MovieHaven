import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/controllers/favourite_controller.dart';
import 'package:movie_haven/app/shared/views/widget/movies_grid.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: GetBuilder<FavouriteController>(
            init: FavouriteController.instance,
            builder: (controller) {
              return StreamBuilder(
                  stream: controller.moviesStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    var isEmpty =
                        snapshot.data != null && snapshot.data!.docs.isEmpty;
                    List<MovieModel> movies = snapshot.data!.docs
                        .map(
                          (el) => MovieModel.fromJson(
                            el.data() as Map<String, dynamic>,
                          ),
                        )
                        .toList();

                    return isEmpty
                        ? const Center(
                            child: Text(
                              "You don't have any favorite movies",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                          )
                        : MoviesGrid(movies: movies);
                  });
            }),
      ),
    );
  }
}
