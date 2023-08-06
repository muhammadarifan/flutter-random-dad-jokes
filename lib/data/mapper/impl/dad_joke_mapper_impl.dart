
import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/data/mapper/dad_joke_mapper.dart';
import 'package:random_dad_jokes/data/remote/model/dad_joke_remote.dart';

@Injectable(as: DadJokeMapper)
@singleton
class DadJokeMapperImpl extends DadJokeMapper {
  @override
  DadJokeRemote fromDomainToRemote(DadJoke source) {
    return DadJokeRemote(joke: source.joke);
  }

  @override
  DadJoke fromRemoteToDomain(DadJokeRemote source) {
    return DadJoke(joke: source.joke);
  }

}
