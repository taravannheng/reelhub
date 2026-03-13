import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class Person {
  final bool adult;

  @JsonKey(name: 'also_known_as')
  final List<String> alsoKnownAs;

  final String biography;
  final String? birthday;
  final String? deathday;
  final int gender;
  final String? homepage;
  final int id;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;

  final String name;

  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;

  final double popularity;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  Person({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.knownForDepartment,
    required this.name,
    this.placeOfBirth,
    required this.popularity,
    this.profilePath,
  });

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}