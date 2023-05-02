import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_results.freezed.dart';

@freezed
class MovieResults with _$MovieResults {
  const factory MovieResults({
    bool? adult,
    String? backdropPath,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _MovieResults;
}
