// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_example/app/network/dio.dart' as _i8;
import 'package:bloc_example/core/data/api_client/api_client.dart' as _i4;
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart'
    as _i5;
import 'package:bloc_example/feature/movies/data/repository/movie_repository.dart'
    as _i6;
import 'package:bloc_example/feature/movies/domain/cubit/movie_cubit.dart'
    as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
  gh.singleton<_i3.Dio>(movieDio.dio);
  gh.factory<_i4.ApiClient>(() => _i4.ApiClient(gh<_i3.Dio>()));
  gh.singleton<_i5.IMovieRepository>(_i6.MovieRepository(gh<_i4.ApiClient>()));
  gh.singleton<_i7.MovieCubit>(_i7.MovieCubit(gh<_i5.IMovieRepository>()));
  return getIt;
}

class _$MovieDio extends _i8.MovieDio {}
