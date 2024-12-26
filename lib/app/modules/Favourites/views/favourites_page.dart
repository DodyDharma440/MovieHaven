import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Favourites/controllers/favourite_controller.dart';
import 'package:movie_haven/app/shared/views/widget/movie_card.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({super.key});

  final controller = FavouriteController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: GetBuilder<FavouriteController>(builder: (controller) {
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
                      : GridView.builder(
                          itemCount: snapshot.data?.docs.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 310,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                          ),
                          itemBuilder: (_, index) {
                            var item = MovieModel.fromJson(
                              snapshot.data?.docs[index].data()
                                  as Map<String, dynamic>,
                            );
                            return MovieCard(
                              item: item,
                              cardWidth: null,
                            );
                          },
                        );
                });
          }),
        ),
      ),
    );
  }
}
