import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';

@JsonSerializable()
class BreedResponse {
  @JsonKey(name: 'weight')
  final WeightResponse? weight;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'cfa_url')
  final String? cfaUrl;
  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;
  @JsonKey(name: 'vcahospitals_url')
  final String? vcahospitalsUrl;
  @JsonKey(name: 'temperament')
  final String? temperament;
  @JsonKey(name: 'origin')
  final String? origin;
  @JsonKey(name: 'country_codes')
  final String? countryCodes;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  @JsonKey(name: 'indoor')
  final int? indoor;
  @JsonKey(name: 'lap')
  final int? lap;
  @JsonKey(name: 'alt_names')
  final String? altNames;
  @JsonKey(name: 'adaptability')
  final int? adaptability;
  @JsonKey(name: 'affection_level')
  final int? affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int? childFriendly;
  @JsonKey(name: 'dog_friendly')
  final int? dogFriendly;
  @JsonKey(name: 'energy_level')
  final int? energyLevel;
  @JsonKey(name: 'grooming')
  final int? grooming;
  @JsonKey(name: 'health_issues')
  final int? healthIssues;
  @JsonKey(name: 'intelligence')
  final int? intelligence;
  @JsonKey(name: 'shedding_level')
  final int? sheddingLevel;
  @JsonKey(name: 'social_needs')
  final int? socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  final int? strangerFriendly;
  @JsonKey(name: 'vocalisation')
  final int? vocalisation;
  @JsonKey(name: 'experimental')
  final int? experimental;
  @JsonKey(name: 'hairless')
  final int? hairless;
  @JsonKey(name: 'natural')
  final int? natural;
  @JsonKey(name: 'rare')
  final int? rare;
  @JsonKey(name: 'rex')
  final int? rex;
  @JsonKey(name: 'suppressed_tail')
  final int? suppressedTail;
  @JsonKey(name: 'short_legs')
  final int? shortLegs;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  @JsonKey(name: 'hypoallergenic')
  final int? hypoallergenic;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  @JsonKey(name: 'image')
  final ImageCatResponse? imageCatResponse;

  BreedResponse({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
    required this.imageCatResponse,
  });

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedResponseToJson(this);
}

@JsonSerializable()
class WeightResponse {
  @JsonKey(name: 'imperial')
  final String? imperial;
  @JsonKey(name: 'metric')
  final String? metric;

  WeightResponse({
    required this.imperial,
    required this.metric,
  });

  factory WeightResponse.fromJson(Map<String, dynamic> json) =>
      _$WeightResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeightResponseToJson(this);
}

@JsonSerializable()
class ImageCatResponse {
  @JsonKey(name: 'url')
  final String? url;

  ImageCatResponse(this.url);

  factory ImageCatResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageCatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageCatResponseToJson(this);
}