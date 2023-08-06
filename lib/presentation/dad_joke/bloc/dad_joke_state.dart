part of 'dad_joke_bloc.dart';

@freezed
class DadJokeState with _$DadJokeState {
  const factory DadJokeState.initial() = _Initial;

  const factory DadJokeState.loading() = _Loading;

  const factory DadJokeState.loaded(List<DadJoke> dadJokes) = _Loaded;

  const factory DadJokeState.error(String message) = _Error;

  const factory DadJokeState.empty() = _Empty;

  const factory DadJokeState.noInternet() = _NoInternet;
}
