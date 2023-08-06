// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/impl/network_config_impl.dart' as _i6;
import '../config/network_config.dart' as _i5;
import '../data/domain/repository/dad_joke_repository.dart' as _i9;
import '../data/domain/repository/impl/dad_joke_repository_impl.dart' as _i10;
import '../data/domain/usecase/dad_joke_usecase.dart' as _i11;
import '../data/domain/usecase/impl/dad_joke_usecase_impl.dart' as _i12;
import '../data/mapper/dad_joke_mapper.dart' as _i3;
import '../data/mapper/impl/dad_joke_mapper_impl.dart' as _i4;
import '../data/remote/service/dad_joke_service.dart' as _i8;
import '../presentation/dad_joke/bloc/dad_joke_bloc.dart' as _i13;
import 'module/app_module.dart' as _i14;

const String _DEVELOPMENT = 'DEVELOPMENT';
const String _STAGING = 'STAGING';
const String _PRODUCTION = 'PRODUCTION';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.DadJokeMapper>(() => _i4.DadJokeMapperImpl());
  gh.factory<_i5.NetworkConfig>(
    () => _i6.NetworkConfigDevelopmentImpl(),
    registerFor: {_DEVELOPMENT},
  );
  gh.factory<_i5.NetworkConfig>(
    () => _i6.NetworkConfigStagingImpl(),
    registerFor: {_STAGING},
  );
  gh.factory<_i5.NetworkConfig>(
    () => _i6.NetworkConfigProductionImpl(),
    registerFor: {_PRODUCTION},
  );
  gh.singleton<_i7.Dio>(appModule.dio(gh<_i5.NetworkConfig>()));
  gh.singleton<_i8.DadJokeService>(appModule.dadJokeService(
    gh<_i7.Dio>(),
    gh<_i5.NetworkConfig>(),
  ));
  gh.factory<_i9.DadJokeRepository>(() => _i10.DadJokeRepositoryDevelopmentImpl(
        gh<_i8.DadJokeService>(),
        gh<_i3.DadJokeMapper>(),
      ));
  gh.factory<_i11.DadJokeUsecase>(
      () => _i12.DadJokeUsecaseImpl(gh<_i9.DadJokeRepository>()));
  gh.factory<_i13.DadJokeBloc>(
      () => _i13.DadJokeBloc(gh<_i11.DadJokeUsecase>()));
  return getIt;
}

class _$AppModule extends _i14.AppModule {}
