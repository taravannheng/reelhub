import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class Episode {
  final int id;
  final String name;
  final String overview;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  @JsonKey(name: 'air_date')
  final String? airDate;

  @JsonKey(name: 'episode_number')
  final int episodeNumber;

  final int? runtime;

  @JsonKey(name: 'season_number')
  final int seasonNumber;

  @JsonKey(name: 'still_path')
  final String? stillPath;

  Episode({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    this.airDate,
    required this.episodeNumber,
    this.runtime,
    required this.seasonNumber,
    this.stillPath,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}