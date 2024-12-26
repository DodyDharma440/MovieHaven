import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_haven/app/models/movie_model.dart';
import 'package:movie_haven/app/modules/Movie/controller/movie_detail_controller.dart';
import 'package:movie_haven/app/shared/views/widget/horizontal_movies_list.dart';
import 'package:movie_haven/app/shared/views/widget/section_list.dart';
import 'package:movie_haven/config/config.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({super.key});

  final MovieDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments['title'];
    String imagePath = Get.arguments['imagePath'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 500,
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      Config.tmdbImageUrl(imagePath),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.5),
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GetBuilder<MovieDetailController>(
              builder: (controller) {
                MovieModel? movie = controller.movie;

                return controller.isLoading.value
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie?.title ?? "",
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                height: 1.2,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              movie?.genres
                                                      ?.map((el) => el.name)
                                                      .join(", ") ??
                                                  "",
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "${movie?.voteAverage.toStringAsFixed(1)} (${movie?.voteCount} reviews)",
                                                  style: const TextStyle(
                                                    color: Colors.white54,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {},
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: const SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                            child: Icon(
                                              Icons.star_border_outlined,
                                              size: 28,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  SectionList(
                                    title: "Overview",
                                    child: Text(
                                      movie?.overview ?? "-",
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SectionList(
                                    title: "Tagline",
                                    child: Text(
                                      movie?.tagline ?? "-",
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SectionList(
                                    title: "Status",
                                    child: Text(
                                      (movie?.status ?? "-") == "Released"
                                          ? "Released at ${movie?.releaseDate != null ? DateFormat("yMMMMd").format(DateTime.parse(movie?.releaseDate ?? "")) : '-'}"
                                          : movie?.status ?? "-",
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SectionList(
                                    title: "Languages",
                                    child: Text(
                                      movie?.languages?.join(", ") ?? "-",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            SectionList(
                              title: "Production companies",
                              titlePadding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: SizedBox(
                                height: 100,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      movie?.productionCompanies?.length ?? 0,
                                      (index) {
                                    var company =
                                        movie?.productionCompanies?[index];
                                    bool imageExist = company?.logoPath != null;
                                    bool isLast = index ==
                                        (movie?.productionCompanies?.length ??
                                                0) -
                                            1;

                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: index == 0 ? 24 : 0,
                                        right: isLast ? 24 : 16,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  image: imageExist
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                            Config.tmdbImageUrl(
                                                                company?.logoPath ??
                                                                    ""),
                                                          ),
                                                          fit: BoxFit.contain,
                                                        )
                                                      : null,
                                                ),
                                                child: imageExist
                                                    ? null
                                                    : const Center(
                                                        child: Icon(
                                                          Icons.person_2,
                                                          color: Colors.grey,
                                                          size: 30,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60,
                                            child: Text(
                                              company?.name ?? "-",
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            SectionList(
                              title: "Recommendations",
                              titlePadding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: HorizontalMoviesList(
                                movies: controller.recommendations,
                              ),
                            )
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
