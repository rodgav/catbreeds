import 'package:thecat_rodgav/application/utils/base_usecase.dart';
import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/domain/mapper/app_preferences_model_mapper.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class SaveAppPreferencesUseCase
    extends BaseUseCase<AppPreferencesModel, AppPreferencesModel> {
  final Repository _repository;

  SaveAppPreferencesUseCase(this._repository);

  @override
  Future<Either<Failure, AppPreferencesModel>> execute(
          AppPreferencesModel input) =>
      _repository.saveAppPreferences(input.domainToData());
}
