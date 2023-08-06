
import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/data/domain/repository/dad_joke_repository.dart';
import 'package:random_dad_jokes/data/domain/usecase/dad_joke_usecase.dart';
import 'package:random_dad_jokes/utils/resource.dart';

@Injectable(as : DadJokeUsecase)
@singleton
class DadJokeUsecaseImpl implements DadJokeUsecase {
  DadJokeUsecaseImpl(this._dadJokeRepository);

  final DadJokeRepository _dadJokeRepository;

  @override
  Future<Resource<List<DadJoke>>> invokeManyDadJokes(int limit) async {
    return _dadJokeRepository.getDadJokes(limit);
  }

  @override
  Future<Resource<List<DadJoke>>> invokeOneDadJoke() async {
    return _dadJokeRepository.getDadJokes(1);
  }
}
