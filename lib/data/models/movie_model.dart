import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  final int id;

  @JsonKey(name: 'media_type')
  final String mediaType;

  final bool adult;

  final String? title; // movie
  final String? name; // tv / person

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  final String? overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  final double? popularity;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  final bool? video;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  Movie({
    required this.id,
    required this.mediaType,
    required this.adult,
    this.title,
    this.name,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.firstAirDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
