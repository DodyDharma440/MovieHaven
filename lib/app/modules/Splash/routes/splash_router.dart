import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Splash/routes/splash_routes.dart';
import 'package:movie_haven/app/modules/Splash/views/splash_page.dart';

List<GetPage> splashRoutes = [
  GetPage(name: SplashRoutes.splash, page: () => const SplashPage())
];
