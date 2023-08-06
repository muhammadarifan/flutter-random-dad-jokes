// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'dad_joke.g.dart';

@JsonSerializable()
class DadJoke {
  DadJoke({required this.joke});

  factory DadJoke.fromJson(Map<String, dynamic> json) =>
      _$DadJokeFromJson(json);

  final String joke;
}
