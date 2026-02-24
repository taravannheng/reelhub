// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
  voteCount: (json['vote_count'] as num).toInt(),
  airDate: json['air_date'] as String?,
  episodeNumber: (json['episode_number'] as num).toInt(),
  runtime: (json['runtime'] as num?)?.toInt(),
  seasonNumber: (json['season_number'] as num).toInt(),
  stillPath: json['still_path'] as String?,
);

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'overview': instance.overview,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'air_date': instance.airDate,
  'episode_number': instance.episodeNumber,
  'runtime': instance.runtime,
  'season_number': instance.seasonNumber,
  'still_path': instance.stillPath,
};
