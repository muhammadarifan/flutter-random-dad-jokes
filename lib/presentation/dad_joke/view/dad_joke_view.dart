
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/l10n/l10n.dart';
import 'package:random_dad_jokes/presentation/dad_joke/bloc/dad_joke_bloc.dart';

class DadJokeView extends StatelessWidget {
  const DadJokeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Container(
        alignment: Alignment.center,
        child: BlocBuilder<DadJokeBloc, DadJokeState>(
            builder: (context, state) {
              return state.when(
                  initial: () {
                    return const Text('Initial');
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                  loaded: (List<DadJoke> dadJokes) {
                    return ListView.builder(
                      itemCount: dadJokes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(dadJokes[index].joke),
                        );
                      },
                    );
                  },
                  error: (String message) {
                    return Text(message);
                  },
                  empty: () {
                    return const Text('Empty');
                  },
                  noInternet: () {
                    return const Text('No Internet');
                  }
              );
            }
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<DadJokeBloc>().add(
                const DadJokeEvent.invokeOneDadJoke(),
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<DadJokeBloc>().add(
              const DadJokeEvent.invokeDadJokesWithLimit(5),
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

