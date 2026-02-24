// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  logoPath: json['logo_path'] as String?,
  originCountry: json['origin_country'] as String,
);

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_path': instance.logoPath,
  'origin_country': instance.originCountry,
};
