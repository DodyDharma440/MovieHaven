import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:movie_haven/app/shared/controllers/auth_state.dart';
import 'package:movie_haven/config/config.dart';
import 'package:movie_haven/config/theme.dart';
import 'package:movie_haven/firebase_options.dart';
import 'package:movie_haven/routes/router.dart';
import 'package:movie_haven/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put<AuthState>(AuthState(), permanent: true);

  runApp(const MyApp());
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
