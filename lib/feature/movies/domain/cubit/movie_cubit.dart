import 'package:bloc/bloc.dart';
import 'package:bloc_example/app/network/error/error_handling/app_failure.dart';
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

@singleton
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(IMovieRepository iMovieRepository)
      : _iMovieRepository = iMovieRepository,
        super(const MovieState.initial());

  final IMovieRepository _iMovieRepository;

  Future<void> getMoviesList(int page) async {
    emit(const MovieState.loading());
    final results = await _iMovieRepository.fetchPopularMovieResults(
      page,
    );

    results.fold(
      (l) => emit(MovieState.error(l)),
      (r) => emit(MovieState.loaded(r, page)),
    );
  }

  Future<void> getRefreshedMoviesList(int page) async {
    final results = await _iMovieRepository.fetchPopularMovieResults(
      page,
    );

    results.fold(
      (l) => emit(MovieState.error(l)),
      (r) => emit(MovieState.loaded(r, page)),
    );
  }

  Future<List<MovieResults>> getMovieResultsList(int page) async {
    return _iMovieRepository.fetchPopularMovieResultsList(page);
  }
}
