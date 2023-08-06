
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/data/remote/model/dad_joke_remote.dart';

abstract class DadJokeMapper {
  DadJoke fromRemoteToDomain(DadJokeRemote source);
  DadJokeRemote fromDomainToRemote(DadJoke source);
}
