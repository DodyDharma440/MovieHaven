import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/routes/auth_router.dart';
import 'package:movie_haven/app/modules/Home/routes/home_router.dart';
import 'package:movie_haven/app/modules/Splash/routes/splash_router.dart';

List<GetPage> routes = [...splashRoutes, ...authRoutes, ...homeRoutes];
