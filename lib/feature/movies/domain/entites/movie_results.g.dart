// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieResultsAdapter extends TypeAdapter<MovieResults> {
  @override
  final int typeId = 0;

  @override
  MovieResults read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieResults(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      id: fields[2] as int?,
      originalLanguage: fields[3] as String?,
      originalTitle: fields[4] as String?,
      overview: fields[5] as String?,
      popularity: fields[6] as double?,
      posterPath: fields[7] as String?,
      releaseDate: fields[8] as DateTime?,
      title: fields[9] as String?,
      video: fields[10] as bool?,
      voteAverage: fields[11] as double?,
      voteCount: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieResults obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.video)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieResultsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieResults _$$_MovieResultsFromJson(Map<String, dynamic> json) =>
    _$_MovieResults(
      adult: json['adult'] as bool?,
      backdropPath: json['backdropPath'] as String?,
      id: json['id'] as int?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
    );

Map<String, dynamic> _$$_MovieResultsToJson(_$_MovieResults instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
