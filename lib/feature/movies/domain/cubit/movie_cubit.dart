// ignore_for_file: unnecessary_lambdas

import 'package:bloc/bloc.dart';
import 'package:bloc_example/core/domain/error_handling/app_failure.dart';
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this._iMovieRepository) : super(const MovieState.initial());
  final IMovieRepository _iMovieRepository;

  Future<void> getUpcomingMovies() async {
    emit(const MovieState.loading());

    final results = await _iMovieRepository.fetchPopularMovieResults();
    results.fold(
      (l) => MovieState.error(l),
      (r) => emit(MovieState.loaded(r)),
    );
  }
}
