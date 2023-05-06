import 'package:bloc/bloc.dart';
import 'package:bloc_example/core/domain/error_handling/app_failure.dart';
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:bloc_example/feature/movies/domain/entites/popular_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

@singleton
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(IMovieRepository iMovieRepository)
      : _iMovieRepository = iMovieRepository,
        super(const MovieState.initial()) {
    _currentPage = 1;
    _pageSize = 15;
  }

  final IMovieRepository _iMovieRepository;
  late int _currentPage;
  late int _pageSize;

  Future<void> getNextPage() async {
    emit(const MovieState.loading());

    final results = await _iMovieRepository.fetchPopularMovieResults(
      _currentPage,
    );

    results.fold(
      (l) => emit(MovieState.error(l)),
      (r) {
        _currentPage++;
        emit(MovieState.loaded(r, _currentPage));
      },
    );
  }

  bool hasNextPage(List<PopularMovies> movies) {
    return movies.length >= _pageSize;
  }
}
