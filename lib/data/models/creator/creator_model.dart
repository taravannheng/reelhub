import 'package:json_annotation/json_annotation.dart';

part 'creator_model.g.dart';

@JsonSerializable()
class Creator {
  final int id;
  final String name;
  final int? gender;

  @JsonKey(name: 'credit_id')
  final String creditId;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  Creator({
    required this.id,
    required this.name,
    this.gender,
    required this.creditId,
    this.profilePath,
  });

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}