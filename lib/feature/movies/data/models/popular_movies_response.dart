import 'package:bloc_example/feature/movies/data/models/movie_results_response.dart';
import 'package:bloc_example/feature/movies/domain/entites/popular_movies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularMoivesResponse {
  PopularMoivesResponse({
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoivesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoivesResponseFromJson(json);
  int? page;
  List<MovieResultsResponse>? results;
  int? totalPages;
  int? totalResults;
  Map<String, dynamic> toJson() => _$PopularMoivesResponseToJson(this);

  PopularMovies toDomain() => PopularMovies(
        movieResults: results?.map((e) => e.toDomain()).toList(),
        page: page,
        totalPages: totalPages,
        totalResults: totalResults,
      );
}
