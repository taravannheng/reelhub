// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String,
  posterPath: json['poster_path'] as String?,
  seasonNumber: (json['season_number'] as num).toInt(),
  episodeCount: (json['episode_count'] as num).toInt(),
  airDate: json['air_date'] as String?,
  voteAverage: (json['vote_average'] as num).toDouble(),
);

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'season_number': instance.seasonNumber,
  'episode_count': instance.episodeCount,
  'air_date': instance.airDate,
  'vote_average': instance.voteAverage,
};
