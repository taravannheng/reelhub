// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  mediaType: json['media_type'] as String,
  adult: json['adult'] as bool,
  title: json['title'] as String?,
  name: json['name'] as String?,
  originalTitle: json['original_title'] as String?,
  overview: json['overview'] as String?,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  originalLanguage: json['original_language'] as String?,
  genreIds: (json['genre_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  popularity: (json['popularity'] as num?)?.toDouble(),
  releaseDate: json['release_date'] as String?,
  firstAirDate: json['first_air_date'] as String?,
  video: json['video'] as bool?,
  voteAverage: (json['vote_average'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'media_type': instance.mediaType,
  'adult': instance.adult,
  'title': instance.title,
  'name': instance.name,
  'original_title': instance.originalTitle,
  'overview': instance.overview,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
  'original_language': instance.originalLanguage,
  'genre_ids': instance.genreIds,
  'popularity': instance.popularity,
  'release_date': instance.releaseDate,
  'first_air_date': instance.firstAirDate,
  'video': instance.video,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
};
