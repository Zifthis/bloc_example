import 'package:bloc/bloc.dart';
import 'package:bloc_example/app/network/error/error_handling/app_failure.dart';
import 'package:bloc_example/app/storage/repository/i_movie_local_storage.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_storage_cubit.freezed.dart';
part 'movie_storage_state.dart';

@singleton
class MovieStorageCubit extends Cubit<MovieStorageState> {
  MovieStorageCubit(IMovieLocalStorage iMovieLocalStorage)
      : _movieLocalStorage = iMovieLocalStorage,
        super(const MovieStorageState.initial());

  final IMovieLocalStorage _movieLocalStorage;

  Future<void> getMovieList() async {
    emit(const MovieStorageState.loading());
    final locationList = await _movieLocalStorage.getMovieList();
    locationList.fold(
        (error) => emit(
              MovieStorageState.error(error),
            ), (data) {
      return data.isNotEmpty
          ? emit(MovieStorageState.loaded(data))
          : emit(const MovieStorageState.emptyList());
    });
  }

  Future<void> addMovie(MovieResults movie) async {
    await _movieLocalStorage.addMovieToList(movie);
    await getMovieList();
  }

  Future<void> deleteMovie(MovieResults movie, int index) async {
    await _movieLocalStorage.removeMovieFromList(index);
    await getMovieList();
  }

  Future<void> deleteAllMovies() async {
    await _movieLocalStorage.clearMovieList();
    emit(const MovieStorageState.emptyList());
  }
}
