import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

@JsonSerializable()
class Season {
  final int id;
  final String name;
  final String overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'season_number')
  final int seasonNumber;

  @JsonKey(name: 'episode_count')
  final int episodeCount;

  @JsonKey(name: 'air_date')
  final String? airDate;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  Season({
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    required this.seasonNumber,
    required this.episodeCount,
    this.airDate,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) =>
      _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}