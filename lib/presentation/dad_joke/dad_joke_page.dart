
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_dad_jokes/di/injection.dart';
import 'package:random_dad_jokes/presentation/dad_joke/bloc/dad_joke_bloc.dart';
import 'package:random_dad_jokes/presentation/dad_joke/view/dad_joke_view.dart';

class DadJokePage extends StatelessWidget {
  const DadJokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<DadJokeBloc>(),
        child: const DadJokeView(),
    );
  }
}

