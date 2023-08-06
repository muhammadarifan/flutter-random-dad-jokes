
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/config/network_config.dart';
import 'package:random_dad_jokes/data/remote/service/dad_joke_service.dart';

@module
abstract class AppModule {
  @singleton
  Dio dio(NetworkConfig config) {
    final dio = Dio();
    dio.options.headers = config.headers;
    return dio;
  }

  @singleton
  DadJokeService dadJokeService(Dio dio, NetworkConfig config) {
    return DadJokeService(dio, baseUrl: config.baseUrl);
  }
}