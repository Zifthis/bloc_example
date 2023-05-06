import 'package:bloc_example/feature/movies/data/models/movie_results_response.dart';
import 'package:bloc_example/feature/movies/data/models/popular_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/movie/upcoming')
  Future<PopularMoivesResponse> getUpcomingMovies(
    @Query('page') int page,
  );

  @GET('/movie/upcoming')
  Future<List<MovieResultsResponse>> getMoviesResults(
    @Query('page') int page,
  );
}
