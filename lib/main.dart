import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/modules/Movie/controller/movie_detail_controller.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/config/config.dart';
import 'package:movie_haven/config/theme.dart';
import 'package:movie_haven/firebase_options.dart';
import 'package:movie_haven/routes/router.dart';
import 'package:movie_haven/routes/routes.dart';

void main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Get.put<AuthState>(AuthState(), permanent: true);
  Get.create(() => MovieDetailController());

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Config.appName,
      theme: theme,
      initialRoute: Routes.splash,
      getPages: routes,
    );
  }
}
