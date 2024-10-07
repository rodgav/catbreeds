import 'package:thecat_rodgav/application/utils/base_usecase.dart';
import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/domain/model/breed_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class GetBreedUseCase extends BaseUseCase<String, BreedModel> {
  final Repository _repository;

  GetBreedUseCase(this._repository);

  @override
  Future<Either<Failure, BreedModel>> execute(String input) =>
      _repository.getBreed(input);
}
