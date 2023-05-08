import 'package:bloc_example/app/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'movie_results.freezed.dart';
part 'movie_results.g.dart';

@freezed
@HiveType(typeId: Constants.hiveTypeId)
class MovieResults with _$MovieResults {
  const factory MovieResults({
    @HiveField(0) bool? adult,
    @HiveField(1) String? backdropPath,
    @HiveField(2) int? id,
    @HiveField(3) String? originalLanguage,
    @HiveField(4) String? originalTitle,
    @HiveField(5) String? overview,
    @HiveField(6) double? popularity,
    @HiveField(7) String? posterPath,
    @HiveField(8) DateTime? releaseDate,
    @HiveField(9) String? title,
    @HiveField(10) bool? video,
    @HiveField(11) double? voteAverage,
    @HiveField(12) int? voteCount,
  }) = _MovieResults;

  factory MovieResults.fromJson(Map<String, dynamic> json) =>
      _$MovieResultsFromJson(json);
}
