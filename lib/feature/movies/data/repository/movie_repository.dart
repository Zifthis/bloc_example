import 'package:bloc_example/core/data/api_client/api_client.dart';
import 'package:bloc_example/core/domain/error_handling/app_failure.dart';
import 'package:bloc_example/core/domain/error_handling/either_failure_or.dart';
import 'package:bloc_example/feature/movies/data/repository/i_movie_repository.dart';
import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepository implements IMovieRepository {
  MovieRepository(this._apiClient);

  final ApiClient _apiClient;

  @override
  EitherAppFailureOr<List<MovieResults>> fetchPopularMovieResults() async {
    try {
      final response = await _apiClient.getUpcomingMovies();
      return Right(response.map((e) => e.toDomain()).toList());
    } on DioError catch (error) {
      return Left(AppFailure.fromDioErrorResponse(error));
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }

  @override
  EitherAppFailureOr<List<MovieResults>> fetchMovieResults() {
    // TODO: implement fetchMovieResults
    throw UnimplementedError();
  }
}
