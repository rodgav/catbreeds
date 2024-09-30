import 'package:thecat_rodgav/application/utils/base_usecase.dart';
import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/domain/model/breed_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class GetBreedsUseCase extends BaseUseCase<void, List<BreedModel>> {
  final Repository _repository;

  GetBreedsUseCase(this._repository);

  @override
  Future<Either<Failure, List<BreedModel>>> execute(void input) =>
      _repository.getBreeds();
}
