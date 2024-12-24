import 'package:dio/dio.dart';

class BaseService {
  late Dio api;

  BaseService() {
    api = Dio(
      BaseOptions(
        baseUrl: "http://localhost:8080",
      ),
    );
  }
}
