import 'package:thecat_rodgav/domain/model/breed_model.dart';
import 'package:thecat_rodgav/view/model/breed.dart';

extension BreedModelMapper on BreedModel {
  Breed domainToView() {
    return Breed(
        weight: weight.domainToView(),
        id: id,
        name: name,
        cfaUrl: cfaUrl,
        vetstreetUrl: vetstreetUrl,
        vcahospitalsUrl: vcahospitalsUrl,
        temperament: temperament,
        origin: origin,
        countryCodes: countryCodes,
        countryCode: countryCode,
        description: description,
        lifeSpan: lifeSpan,
        indoor: indoor,
        lap: lap,
        altNames: altNames,
        adaptability: adaptability,
        affectionLevel: affectionLevel,
        childFriendly: childFriendly,
        dogFriendly: dogFriendly,
        energyLevel: energyLevel,
        grooming: grooming,
        healthIssues: healthIssues,
        intelligence: intelligence,
        sheddingLevel: sheddingLevel,
        socialNeeds: socialNeeds,
        strangerFriendly: strangerFriendly,
        vocalisation: vocalisation,
        experimental: experimental,
        hairless: hairless,
        natural: natural,
        rare: rare,
        rex: rex,
        suppressedTail: suppressedTail,
        shortLegs: shortLegs,
        wikipediaUrl: wikipediaUrl,
        hypoallergenic: hypoallergenic,
        referenceImageId: referenceImageId,
        image: imageCatModel.domainToView());
  }
}

extension WeightModelMapper on WeightModel {
  Weight domainToView() {
    return Weight(imperial: imperial, metric: metric);
  }
}

extension ImageCatModelMapper on ImageCatModel {
  ImageCat domainToView() {
    return ImageCat(url);
  }
}
