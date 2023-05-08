part of 'movie_storage_cubit.dart';

@freezed
class MovieStorageState with _$MovieStorageState {
  const factory MovieStorageState.initial() = _Initial;
  const factory MovieStorageState.loading() = _Loading;
  const factory MovieStorageState.emptyList() = _EmptyList;
  const factory MovieStorageState.loaded(
    List<MovieResults> movieList,
  ) = _Loaded;
  const factory MovieStorageState.error(AppFailure error) = _Error;
}
