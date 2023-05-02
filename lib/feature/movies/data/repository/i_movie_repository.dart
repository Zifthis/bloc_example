import 'package:bloc_example/core/domain/error_handling/either_failure_or.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';

abstract class IMovieRepository {
  EitherAppFailureOr<List<MovieResults>> fetchPopularMovieResults();
  EitherAppFailureOr<List<MovieResults>> fetchMovieResults();
}
