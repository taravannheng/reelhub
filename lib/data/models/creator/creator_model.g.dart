// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  gender: (json['gender'] as num?)?.toInt(),
  creditId: json['credit_id'] as String,
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'gender': instance.gender,
  'credit_id': instance.creditId,
  'profile_path': instance.profilePath,
};
