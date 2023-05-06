import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_movies.freezed.dart';

@freezed
class PopularMovies with _$PopularMovies {
  const factory PopularMovies({
    int? page,
    List<MovieResults>? movieResults,
    int? totalPages,
    int? totalResults,
  }) = _PopularMovies;
}
