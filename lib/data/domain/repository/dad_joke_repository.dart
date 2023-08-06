
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/utils/resource.dart';

abstract class DadJokeRepository {
  Future<Resource<List<DadJoke>>> getDadJokes(int limit);
}
