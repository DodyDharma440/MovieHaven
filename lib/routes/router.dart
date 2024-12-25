import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/routes/auth_router.dart';
import 'package:movie_haven/app/modules/Home/routes/home_router.dart';
import 'package:movie_haven/app/modules/Movie/routes/movie_router.dart';
import 'package:movie_haven/app/modules/Settings/routes/settings_router.dart';
import 'package:movie_haven/app/modules/Splash/routes/splash_router.dart';
import 'package:movie_haven/app/shared/views/layout/main_layout.dart';
import 'package:movie_haven/routes/routes.dart';

List<GetPage> routes = [
  GetPage(name: Routes.main, page: () => MainLayout()),
  ...splashRoutes,
  ...authRoutes,
  ...homeRoutes,
  ...settingsRoutes,
  ...movieRoutes,
];
