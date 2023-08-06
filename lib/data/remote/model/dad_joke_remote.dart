// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'dad_joke_remote.g.dart';

@JsonSerializable()
class DadJokeRemote {
  DadJokeRemote({required this.joke});

  factory DadJokeRemote.fromJson(Map<String, dynamic> json) =>
      _$DadJokeRemoteFromJson(json);

  final String joke;
}
