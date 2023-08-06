
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/utils/resource.dart';

abstract class DadJokeUsecase {
  Future<Resource<List<DadJoke>>> invokeOneDadJoke();
  Future<Resource<List<DadJoke>>> invokeManyDadJokes(int limit);
}
