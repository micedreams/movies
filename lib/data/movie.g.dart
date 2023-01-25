// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as int,
      poster_path: json['poster_path'] as String?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      release_date: json['release_date'] as String?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.poster_path,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'vote_average': instance.vote_average,
    };
