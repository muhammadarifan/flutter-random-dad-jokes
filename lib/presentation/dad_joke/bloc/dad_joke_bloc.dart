import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/data/domain/usecase/dad_joke_usecase.dart';

part 'dad_joke_event.dart';
part 'dad_joke_state.dart';
part 'dad_joke_bloc.freezed.dart';

@injectable
class DadJokeBloc extends Bloc<DadJokeEvent, DadJokeState> {

  final DadJokeUsecase _dadJokeUsecase;

  DadJokeBloc(this._dadJokeUsecase) : super(const DadJokeState.initial()) {
    on<DadJokeEvent>((event, emit) async {
      await event.map(
          started: (_Started value) {
            emit(const DadJokeState.initial());
          },
          invokeOneDadJoke: (_FetchOneDadJoke value) async {
            emit(const DadJokeState.loading());
            await _dadJokeUsecase.invokeOneDadJoke().then((result) {
              result.when(
                  success: (String message, List<DadJoke> data) {
                    emit(DadJokeState.loaded(data));
                  },
                  failure: (String message, List<DadJoke> data) {
                    emit(DadJokeState.error(message));
                  }
              );
            });
          },
          invokeDadJokesWithLimit: (_FetchDadJokesWithLimit value) async {
            emit(const DadJokeState.loading());
            await _dadJokeUsecase.invokeManyDadJokes(value.limit).then((result) {
              result.when(
                  success: (String message, List<DadJoke> data) {
                    emit(DadJokeState.loaded(data));
                  },
                  failure: (String message, List<DadJoke> data) {
                    emit(DadJokeState.error(message));
                  }
              );
            });
          }
      );
    });
  }
}
