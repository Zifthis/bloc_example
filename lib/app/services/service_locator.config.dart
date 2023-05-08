// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_example/app/network/api_client/api_client.dart' as _i8;
import 'package:bloc_example/app/network/dio.dart' as _i13;
import 'package:bloc_example/app/services/service_locator.dart' as _i14;
import 'package:bloc_example/app/services/shared_prefes.dart' as _i12;
import 'package:bloc_example/app/storage/repository/i_movie_local_storage.dart'
    as _i4;
import 'package:bloc_example/app/storage/repository/movie_local_storage.dart'
    as _i5;
import 'package:bloc_example/feature/favourte_movies/cubit/movie_storage_cubit.dart'
    as _i6;
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart'
    as _i9;
import 'package:bloc_example/feature/movies/data/repository/movie_repository.dart'
    as _i10;
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart'
    as _i11;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

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
  gh.singleton<_i4.IMovieLocalStorage>(_i5.MovieLocalStorage());
  gh.singleton<_i6.MovieStorageCubit>(
      _i6.MovieStorageCubit(gh<_i4.IMovieLocalStorage>()));
  gh.factoryAsync<_i7.SharedPreferences>(() => registerModule.prefs);
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(gh<_i3.Dio>()));
  gh.singleton<_i9.IMovieRepository>(_i10.MovieRepository(gh<_i8.ApiClient>()));
  gh.singleton<_i11.MovieCubit>(_i11.MovieCubit(gh<_i9.IMovieRepository>()));
  gh.singletonAsync<_i12.MovieStorage>(() async =>
      _i12.MovieStorage(await gh.getAsync<_i7.SharedPreferences>()));
  return getIt;
}

class _$MovieDio extends _i13.MovieDio {}

class _$RegisterModule extends _i14.RegisterModule {}
