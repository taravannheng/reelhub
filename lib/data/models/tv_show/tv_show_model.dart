import 'package:json_annotation/json_annotation.dart';
import 'package:reelhub/data/models/creator/creator_model.dart';
import 'package:reelhub/data/models/episode/episode_model.dart';
import 'package:reelhub/data/models/genre/genre_model.dart';
import 'package:reelhub/data/models/network_company/network_company_model.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/data/models/production_country/production_country_model.dart';
import 'package:reelhub/data/models/season/season_model.dart';
import 'package:reelhub/data/models/spoken_language/spoken_language_model.dart';

part 'tv_show_model.g.dart';

@JsonSerializable()
class TvShow {
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'created_by')
  final List<Creator> createdBy;

  @JsonKey(name: 'episode_run_time')
  final List<int> episodeRunTime;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  final List<Genre> genres;

  final String? homepage;

  final int id;

  @JsonKey(name: 'in_production')
  final bool inProduction;

  final List<String> languages;

  @JsonKey(name: 'last_air_date')
  final String? lastAirDate;

  @JsonKey(name: 'last_episode_to_air')
  final Episode? lastEpisodeToAir;

  final String name;

  @JsonKey(name: 'next_episode_to_air')
  final Episode? nextEpisodeToAir;

  final List<Network> networks;

  @JsonKey(name: 'number_of_episodes')
  final int numberOfEpisodes;

  @JsonKey(name: 'number_of_seasons')
  final int numberOfSeasons;

  @JsonKey(name: 'origin_country')
  final List<String> originCountry;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_name')
  final String originalName;

  final String overview;

  final double popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;

  final List<Season> seasons;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  final String status;
  final String tagline;
  final String type;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  TvShow({
    required this.adult,
    this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    this.firstAirDate,
    required this.genres,
    this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    required this.name,
    this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) =>
      _$TvShowFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowToJson(this);
}