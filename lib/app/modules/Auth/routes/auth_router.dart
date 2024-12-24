import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Auth/routes/auth_routes.dart';
import 'package:movie_haven/app/modules/Auth/views/login_page.dart';
import 'package:movie_haven/app/modules/Auth/views/register_page.dart';

List<GetPage> authRoutes = [
  GetPage(name: AuthRoutes.login, page: () => const LoginPage()),
  GetPage(name: AuthRoutes.register, page: () => const RegisterPage()),
];
