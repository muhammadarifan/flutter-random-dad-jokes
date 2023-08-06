
import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:random_dad_jokes/data/domain/entity/dad_joke.dart';
import 'package:random_dad_jokes/data/domain/repository/dad_joke_repository.dart';
import 'package:random_dad_jokes/data/mapper/dad_joke_mapper.dart';
import 'package:random_dad_jokes/data/remote/service/dad_joke_service.dart';
import 'package:random_dad_jokes/utils/resource.dart';

@Injectable(as: DadJokeRepository)
@singleton
class DadJokeRepositoryDevelopmentImpl extends DadJokeRepository {
  DadJokeRepositoryDevelopmentImpl(this._service, this._mapper);

  final DadJokeService _service;
  final DadJokeMapper _mapper;

  @override
  Future<Resource<List<DadJoke>>> getDadJokes(int limit) async {
    try {
      final result = await _service.getDadJokes(limit);
      if (result.response.statusCode == HttpStatus.ok) {
        final domainValues = result.data.map(_mapper.fromRemoteToDomain)
            .toList();
        return Success('Berhasil mendapatkan data', domainValues);
      } else {
        return Failure(
            result.response.statusMessage ?? 'Gagal mendapatkan data',
            <DadJoke>[],
        );
      }
    } catch (e) {
      return Failure(e.toString(), <DadJoke>[]);
    }
  }
}
