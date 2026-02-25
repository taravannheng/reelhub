// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDetails _$MediaDetailsFromJson(Map<String, dynamic> json) => MediaDetails(
  title: json['title'] as String?,
  releaseDate: json['releaseDate'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCompanies: (json['productionCompanies'] as List<dynamic>?)
      ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
      .toList(),
  adult: json['adult'] as bool?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  originalLanguage: json['originalLanguage'] as String?,
  overview: json['overview'] as String?,
);

Map<String, dynamic> _$MediaDetailsToJson(MediaDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'productionCompanies': instance.productionCompanies,
      'adult': instance.adult,
      'popularity': instance.popularity,
      'originalLanguage': instance.originalLanguage,
      'overview': instance.overview,
    };
