import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_haven/app/modules/Home/routes/home_routes.dart';
import 'package:movie_haven/app/modules/Home/views/home_page.dart';

List<GetPage> homeRoutes = [
  GetPage(name: HomeRoutes.home, page: () => HomePage())
];
