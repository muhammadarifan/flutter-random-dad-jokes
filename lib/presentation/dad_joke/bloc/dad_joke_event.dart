part of 'dad_joke_bloc.dart';

@freezed
class DadJokeEvent with _$DadJokeEvent {
  const factory DadJokeEvent.started() = _Started;

  const factory DadJokeEvent.invokeOneDadJoke() = _FetchOneDadJoke;

  const factory DadJokeEvent.invokeDadJokesWithLimit(int limit) = _FetchDadJokesWithLimit;
}
