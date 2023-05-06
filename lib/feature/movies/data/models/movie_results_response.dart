import 'package:bloc_example/feature/movies/domain/entites/movie_results.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_results_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResultsResponse {
  MovieResultsResponse({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  factory MovieResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResultsResponseToJson(this);

  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieResults toDomain() => MovieResults(
        adult: adult,
        backdropPath: backdropPath,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
