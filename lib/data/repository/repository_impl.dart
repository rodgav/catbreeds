import 'dart:async';

import 'package:thecat_rodgav/application/utils/either.dart';
import 'package:thecat_rodgav/application/utils/failure.dart';
import 'package:thecat_rodgav/data/datasource/local_datasource.dart';
import 'package:thecat_rodgav/data/mapper/app_preferences_response_mapper.dart';
import 'package:thecat_rodgav/data/response/app_preferences_response.dart';
import 'package:thecat_rodgav/domain/model/app_preferences_model.dart';
import 'package:thecat_rodgav/domain/repository/repository.dart';



class RepositoryImpl implements Repository {
  final LocalDataSource _localDataSource;
  late StreamController<Either<Failure, AppPreferencesModel>>
      _appPreferencesModelStrCtrl;

  RepositoryImpl(this._localDataSource) {
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
      final appPreferences =
      await _localDataSource.getLocalAppPreferences();
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
}
