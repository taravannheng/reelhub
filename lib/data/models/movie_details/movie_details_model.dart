import 'package:json_annotation/json_annotation.dart';
import 'package:reelhub/data/models/genre/genre_model.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/data/models/production_country/production_country_model.dart';
import 'package:reelhub/data/models/spoken_language/spoken_language_model.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetails {
  final bool adult;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;

  final int budget;

  final List<Genre> genres;

  final String? homepage;

  final int id;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  final String overview;

  final double popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  final int revenue;

  final int runtime;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  final String status;

  final String? tagline;

  final String title;

  final bool video;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @JsonKey(name: 'vote_count')
  final int voteCount;

  MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}