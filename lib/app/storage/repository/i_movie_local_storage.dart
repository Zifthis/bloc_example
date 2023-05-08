import 'package:bloc_example/app/network/error/error_handling/either_failure_or.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieLocalStorage {
  EitherAppFailureOr<List<MovieResults>> getMovieList();
  EitherAppFailureOr<Unit> addMovieToList(MovieResults movie);
  EitherAppFailureOr<Unit> removeMovieFromList(int index);
  EitherAppFailureOr<Unit> clearMovieList();
}
