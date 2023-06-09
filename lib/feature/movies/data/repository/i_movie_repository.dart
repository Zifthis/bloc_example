import 'package:bloc_example/app/network/error/error_handling/either_failure_or.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';

abstract class IMovieRepository {
  EitherAppFailureOr<List<MovieResults>> fetchPopularMovieResults(int page);
  Future<List<MovieResults>> fetchPopularMovieResultsList(int page);
}
