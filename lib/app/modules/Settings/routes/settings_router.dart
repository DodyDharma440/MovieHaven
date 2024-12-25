import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Settings/routes/settings_routes.dart';
import 'package:movie_haven/app/modules/Settings/views/about_page.dart';
import 'package:movie_haven/app/modules/Settings/views/account_page.dart';

List<GetPage> settingsRoutes = [
  GetPage(name: SettingsRoutes.myAccount, page: () => AccountPage()),
  GetPage(name: SettingsRoutes.about, page: () => AboutPage()),
];
