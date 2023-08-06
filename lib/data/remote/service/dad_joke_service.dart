import 'package:dio/dio.dart';
import 'package:random_dad_jokes/data/remote/model/dad_joke_remote.dart';
import 'package:retrofit/retrofit.dart';

part 'dad_joke_service.g.dart';

@RestApi()
abstract class DadJokeService {
  factory DadJokeService(Dio dio, {String baseUrl}) = _DadJokeService;

  @GET('/dadjokes')
  Future<HttpResponse<List<DadJokeRemote>>> getDadJokes(@Query('limit') int limit);
}
