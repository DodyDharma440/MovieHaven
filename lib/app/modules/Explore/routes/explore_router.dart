import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Explore/routes/explore_routes.dart';
import 'package:movie_haven/app/modules/Explore/views/search_page.dart';

List<GetPage> exploreRoutes = [
  GetPage(name: ExploreRoutes.search, page: () => SearchPage())
];
