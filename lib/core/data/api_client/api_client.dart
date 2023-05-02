import 'package:bloc_example/feature/movies/data/models/movie_results_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/movie/upcoming')
  Future<List<MovieResultsResponse>> getUpcomingMovies();
}
