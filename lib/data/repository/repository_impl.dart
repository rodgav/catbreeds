import 'dart:async';

import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/data/datasource/local_datasource.dart';
import 'package:thecat_rodgav/data/datasource/remote_datasource.dart';
import 'package:thecat_rodgav/data/mapper/app_preferences_response_mapper.dart';
import 'package:thecat_rodgav/data/mapper/breed_mapper.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/model/breed_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;
  late StreamController<Either<Failure, AppPreferencesModel>>
      _appPreferencesModelStrCtrl;

  RepositoryImpl(this._localDataSource, this._remoteDataSource) {
    try {
      _appPreferencesModelStrCtrl =
          StreamController<Either<Failure, AppPreferencesModel>>();
      _localDataSource.streamLocalAppPreferences().map((data) {
        _appPreferencesModelStrCtrl.add(Either.right((data.dataToDomain())));
      });
    } catch (e) {
      _appPreferencesModelStrCtrl
          .add(Either.left(Failure('Cache error', 'Cache error')));
    }
  }

  @override
  Stream<Either<Failure, AppPreferencesModel>> streamLocalAppPreferences() =>
      _appPreferencesModelStrCtrl.stream;

  @override
  Future<Either<Failure, AppPreferencesModel>> getLocalAppPreferences() async {
    try {
      final appPreferences = await _localDataSource.getLocalAppPreferences();
      return Either.right(appPreferences.dataToDomain());
    } catch (e) {
      return Either.left(Failure('Cache error', 'Cache error'));
    }
  }

  @override
  Future<Either<Failure, AppPreferencesModel>> saveAppPreferences(
      AppPreferencesResponse appPreferencesResponse) async {
    try {
      final appPreferences =
          await _localDataSource.saveAppPreferences(appPreferencesResponse);
      return Either.right(appPreferences.dataToDomain());
    } catch (e) {
      return Either.left(Failure('Cache error', 'Cache error'));
    }
  }

  @override
  Future<Either<Failure, List<BreedModel>>> getBreeds(int page) async {
    try {
      final breedsResponse = await _remoteDataSource.getBreeds(page);
      final breeds = breedsResponse.map((e) => e.dataToDomain()).toList();
      return Either.right(breeds);
    } catch (e) {
      return Either.left(Failure('Call Service error', 'Call Service error'));
    }
  }
}
