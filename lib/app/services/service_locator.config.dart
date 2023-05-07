// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_example/app/network/dio.dart' as _i10;
import 'package:bloc_example/app/services/service_locator.dart' as _i11;
import 'package:bloc_example/app/services/shared_prefes.dart' as _i9;
import 'package:bloc_example/core/data/api_client/api_client.dart' as _i5;
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart'
    as _i6;
import 'package:bloc_example/feature/movies/data/repository/movie_repository.dart'
    as _i7;
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart'
    as _i8;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final movieDio = _$MovieDio();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Dio>(movieDio.dio);
  gh.factoryAsync<_i4.SharedPreferences>(() => registerModule.prefs);
  gh.factory<_i5.ApiClient>(() => _i5.ApiClient(gh<_i3.Dio>()));
  gh.singleton<_i6.IMovieRepository>(_i7.MovieRepository(gh<_i5.ApiClient>()));
  gh.singleton<_i8.MovieCubit>(_i8.MovieCubit(gh<_i6.IMovieRepository>()));
  gh.singletonAsync<_i9.MovieStorage>(
      () async => _i9.MovieStorage(await gh.getAsync<_i4.SharedPreferences>()));
  return getIt;
}

class _$MovieDio extends _i10.MovieDio {}

class _$RegisterModule extends _i11.RegisterModule {}
