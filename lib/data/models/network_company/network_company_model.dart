import 'package:json_annotation/json_annotation.dart';

part 'network_company_model.g.dart';

@JsonSerializable()
class Network {
  final int id;
  final String name;

  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @JsonKey(name: 'origin_country')
  final String originCountry;

  Network({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}