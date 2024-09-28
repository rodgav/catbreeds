import 'dart:async';

import 'package:thecat_rodgav/application/utils/base_usecase.dart';
import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class GetLocaleAppPreferencesUseCase
    extends BaseUseCase<void, AppPreferencesModel> {
  final Repository _repository;

  GetLocaleAppPreferencesUseCase(this._repository);

  @override
  Future<Either<Failure, AppPreferencesModel>> execute(void input) =>
      _repository.getLocalAppPreferences();
}
