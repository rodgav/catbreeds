import 'dart:async';

import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/model/breed_model.dart';

abstract class Repository {
  Stream<Either<Failure, AppPreferencesModel>> streamLocalAppPreferences();

  Future<Either<Failure, AppPreferencesModel>> getLocalAppPreferences();

  Future<Either<Failure, AppPreferencesModel>> saveAppPreferences(
      AppPreferencesResponse appPreferencesResponse);

  Future<Either<Failure, List<BreedModel>>> getBreeds();
}
