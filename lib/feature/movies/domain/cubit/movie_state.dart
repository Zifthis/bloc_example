part of 'movie_cubit.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
  const factory MovieState.loading() = _Loading;
  const factory MovieState.loaded(List<MovieResults> movieResults, int page) =
      _Loaded;
  const factory MovieState.error(AppFailure failure) = _Error;
}
