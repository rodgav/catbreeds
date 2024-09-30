import 'package:thecat_rodgav/application/constants/int_constant.dart';
import 'package:thecat_rodgav/application/constants/string_constant.dart';
import 'package:thecat_rodgav/data/response/breed_response.dart';
import 'package:thecat_rodgav/domain/model/breed_model.dart';

extension BreedMapper on BreedResponse? {
  BreedModel dataToDomain() {
    return BreedModel(
        weight: this?.weight.dataToDomain() ??
            WeightModel(
                imperial: TheCatStrings.empty, metric: TheCatStrings.empty),
        id: this?.id ?? TheCatStrings.empty,
        name: this?.name ?? TheCatStrings.empty,
        cfaUrl: this?.cfaUrl ?? TheCatStrings.empty,
        vetstreetUrl: this?.vetstreetUrl ?? TheCatStrings.empty,
        vcahospitalsUrl: this?.vcahospitalsUrl ?? TheCatStrings.empty,
        temperament: this?.temperament ?? TheCatStrings.empty,
        origin: this?.origin ?? TheCatStrings.empty,
        countryCodes: this?.countryCodes ?? TheCatStrings.empty,
        countryCode: this?.countryCode ?? TheCatStrings.empty,
        description: this?.description ?? TheCatStrings.empty,
        lifeSpan: this?.lifeSpan ?? TheCatStrings.empty,
        indoor: this?.indoor ?? TheCatsInts.i0,
        lap: this?.lap ?? TheCatsInts.i0,
        altNames: this?.altNames ?? TheCatStrings.empty,
        adaptability: this?.adaptability ?? TheCatsInts.i0,
        affectionLevel: this?.affectionLevel ?? TheCatsInts.i0,
        childFriendly: this?.childFriendly ?? TheCatsInts.i0,
        dogFriendly: this?.dogFriendly ?? TheCatsInts.i0,
        energyLevel: this?.energyLevel ?? TheCatsInts.i0,
        grooming: this?.grooming ?? TheCatsInts.i0,
        healthIssues: this?.healthIssues ?? TheCatsInts.i0,
        intelligence: this?.intelligence ?? TheCatsInts.i0,
        sheddingLevel: this?.sheddingLevel ?? TheCatsInts.i0,
        socialNeeds: this?.socialNeeds ?? TheCatsInts.i0,
        strangerFriendly: this?.strangerFriendly ?? TheCatsInts.i0,
        vocalisation: this?.vocalisation ?? TheCatsInts.i0,
        experimental: this?.experimental ?? TheCatsInts.i0,
        hairless: this?.hairless ?? TheCatsInts.i0,
        natural: this?.natural ?? TheCatsInts.i0,
        rare: this?.rare ?? TheCatsInts.i0,
        rex: this?.rex ?? TheCatsInts.i0,
        suppressedTail: this?.suppressedTail ?? TheCatsInts.i0,
        shortLegs: this?.shortLegs ?? TheCatsInts.i0,
        wikipediaUrl: this?.wikipediaUrl ?? TheCatStrings.empty,
        hypoallergenic: this?.hypoallergenic ?? TheCatsInts.i0,
        referenceImageId: this?.referenceImageId ?? TheCatStrings.empty,
        imageCatModel: this?.imageCatResponse.dataToDomain() ??
            ImageCatModel(TheCatStrings.empty));
  }
}

extension WeightMapper on WeightResponse? {
  WeightModel dataToDomain() {
    return WeightModel(
        imperial: this?.imperial ?? TheCatStrings.empty,
        metric: this?.metric ?? TheCatStrings.empty);
  }
}

extension ImageCatModelMapper on ImageCatResponse? {
  ImageCatModel dataToDomain() {
    return ImageCatModel(this?.url ?? TheCatStrings.empty);
  }
}
