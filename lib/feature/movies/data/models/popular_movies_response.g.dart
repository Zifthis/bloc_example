// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoivesResponse _$PopularMoivesResponseFromJson(
        Map<String, dynamic> json) =>
    PopularMoivesResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieResultsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$PopularMoivesResponseToJson(
        PopularMoivesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
