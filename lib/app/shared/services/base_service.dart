import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseService {
  late Dio apiTmdb;

  BaseService() {
    apiTmdb = Dio(
      BaseOptions(
          baseUrl:
              "${dotenv.env['TMDB_BASE_URL']}/${dotenv.env['TMDB_API_VERSION']}",
          headers: {
            "Authorization": "Bearer ${dotenv.env['TMDB_TOKEN']}",
          }),
    );
  }
}
